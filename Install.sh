#!/data/data/com.termux/files/usr/bin/bash
clear
echo "
██████╗ ██╗███╗   ██╗ ██████╗     ██████╗ ██╗     ███████╗███████╗███████╗██╗  ██╗███╗   ███╗██████╗ 
██╔══██╗██║████╗  ██║██╔════╝     ██╔══██╗██║     ██╔════╝██╔════╝██╔════╝██║  ██║████╗ ████║██╔══██╗
██║  ██║██║██╔██╗ ██║██║  ███╗    ██████╔╝██║     █████╗  ███████╗███████╗███████║██╔████╔██║██║  ██║
██║  ██║██║██║╚██╗██║██║   ██║    ██╔══██╗██║     ██╔══╝  ╚════██║╚════██║██╔══██║██║╚██╔╝██║██║  ██║
██████╔╝██║██║ ╚████║╚██████╔╝    ██████╔╝███████╗███████╗███████║███████║██║  ██║██║ ╚═╝ ██║██████╔╝
╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═════╝ ╚══════╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═════╝ 
                                                                                         Version 2.0
"

echo "[+] Updating Termux packages..."
pkg update -y && pkg upgrade -y

echo "[+] Installing required packages..."
pkg install -y python python-pip git curl wget nano proot-distro php apache2 termux-api

echo "[+] Installing Python libraries..."
pip install --upgrade pip
pip install requests beautifulsoup4 selenium flask transformers torch numpy pandas scikit-learn
pip install flask-cors colorama pyfiglet termcolor
pip install youtube-dl spotdl

echo "[+] Creating system directories..."
mkdir -p ~/KING_BLESS-XMD
mkdir -p ~/KING_BLESS-XMD/modules
mkdir -p ~/KING_BLESS-XMD/database
mkdir -p ~/KING_BLESS-XMD/downloads
mkdir -p ~/KING_BLESS-XMD/web

echo "[+] Downloading essential tools..."
# Nethunter installer
wget -O ~/KING_BLESS-XMD/nethunter-install.sh https://raw.githubusercontent.com/offensive-security/nethunter-devices/master/installer-nethunter-termux

# Termux tools
pkg install -y nmap hydra sqlmap metasploit wireshark tshark aircrack-ng

echo "[+] Setting up KING_BLESS-XMD AI Core..."
cat > ~/KING_BLESS-XMD/main.py << 'EOF'
#!/data/data/com.termux/files/usr/bin/python3
# KING_BLESS-XMD AI Assistant - Core System
# Created by Kingsley Nyarko

import os
import sys
import requests
import json
import subprocess
import time
import webbrowser
from datetime import datetime
from colorama import Fore, Style, init
import random
import sqlite3
from bs4 import BeautifulSoup

# Initialize colorama
init(autoreset=True)

class KING_BLESS_XMD:
    def __init__(self):
        self.name = "KING_BLESS-XMD AI Assistant"
        self.version = "2.0"
        self.developer = "Kingsley Nyarko"
        self.modules_path = "modules"
        self.db_path = "database/king_bless.db"
        self.initialize_db()
        self.load_modules()
        
    def initialize_db(self):
        """Initialize SQLite database"""
        conn = sqlite3.connect(self.db_path)
        cursor = conn.cursor()
        cursor.execute('''
            CREATE TABLE IF NOT EXISTS users (
                id INTEGER PRIMARY KEY,
                username TEXT,
                session_data TEXT,
                created_at TIMESTAMP
            )
        ''')
        cursor.execute('''
            CREATE TABLE IF NOT EXISTS commands (
                id INTEGER PRIMARY KEY,
                command TEXT,
                response TEXT,
                usage_count INTEGER
            )
        ''')
        conn.commit()
        conn.close()
        
    def load_modules(self):
        """Load AI modules"""
        self.modules = {}
        module_files = [
            'web_search.py',
            'system_tools.py',
            'security_tools.py',
            'download_tools.py',
            'entertainment.py'
        ]
        
        for module in module_files:
            try:
                module_path = os.path.join(self.modules_path, module)
                if os.path.exists(module_path):
                    exec(open(module_path).read())
            except Exception as e:
                print(f"{Fore.RED}[!] Error loading {module}: {e}")
    
    def display_banner(self):
        """Display system banner"""
        os.system('clear')
        banner = f"""
{Fore.CYAN}
╔══════════════════════════════════════════════════════════════════════════════╗
║                                                                              ║
║  ██╗  ██╗██╗███╗   ██╗ ██████╗     ██████╗ ██╗     ███████╗███████╗███████╗  ║
║  ██║ ██╔╝██║████╗  ██║██╔════╝     ██╔══██╗██║     ██╔════╝██╔════╝██╔════╝  ║
║  █████╔╝ ██║██╔██╗ ██║██║  ███╗    ██████╔╝██║     █████╗  ███████╗███████╗  ║
║  ██╔═██╗ ██║██║╚██╗██║██║   ██║    ██╔══██╗██║     ██╔══╝  ╚════██║╚════██║  ║
║  ██║  ██╗██║██║ ╚████║╚██████╔╝    ██████╔╝███████╗███████╗███████║███████║  ║
║  ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═════╝ ╚══════╝╚══════╝╚══════╝╚══════╝  ║
║                                                                              ║
║                    ╔══════════════════════════════════╗                     ║
║                    ║   ADVANCED AI ASSISTANT v{self.version}    ║                     ║
║                    ║   Created by: {self.developer}   ║                     ║
║                    ╚══════════════════════════════════╝                     ║
╚══════════════════════════════════════════════════════════════════════════════╝
{Style.RESET_ALL}
        """
        print(banner)
        
    def process_command(self, command):
        """Process user commands with AI intelligence"""
        command = command.lower().strip()
        
        response = self.analyze_command(command)
        
        if response:
            self.display_response(response)
            return True
        else:
            return self.suggest_help(command)
    
    def analyze_command(self, command):
        """AI-powered command analysis"""
        responses = {
            'hello': f"Hello! I'm {self.name}. How can I assist you today?",
            'help': self.show_help(),
            'time': f"Current time: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}",
            'date': f"Today's date: {datetime.now().strftime('%A, %B %d, %Y')}",
            'who are you': f"I'm {self.name}, an advanced AI assistant created by {self.developer}",
            'version': f"KING_BLESS-XMD Version {self.version}",
            'clear': lambda: os.system('clear'),
            'exit': "Goodbye! Thank you for using KING_BLESS-XMD",
        }
        
        for key in responses:
            if key in command:
                if callable(responses[key]):
                    responses[key]()
                    return None
                return responses[key]
        
        # Web search capability
        if 'search' in command:
            query = command.replace('search', '').strip()
            return self.web_search(query)
        
        # System commands
        if 'install' in command:
            pkg = command.replace('install', '').strip()
            return self.install_package(pkg)
            
        return None
    
    def web_search(self, query):
        """Perform web search"""
        try:
            # Using DuckDuckGo HTML scraping
            url = f"https://html.duckduckgo.com/html/?q={query}"
            headers = {'User-Agent': 'Mozilla/5.0'}
            response = requests.get(url, headers=headers)
            soup = BeautifulSoup(response.text, 'html.parser')
            
            results = []
            for result in soup.find_all('a', class_='result__url', limit=5):
                title = result.text.strip()
                link = result.get('href', '')
                if title and link:
                    results.append(f"{title}: {link}")
            
            if results:
                return f"Search results for '{query}':\n" + "\n".join(results[:3])
            else:
                return "No results found. Try a different query."
                
        except Exception as e:
            return f"Search error: {str(e)}"
    
    def install_package(self, package):
        """Install Termux packages"""
        try:
            result = subprocess.run(['pkg', 'install', '-y', package], 
                                  capture_output=True, text=True)
            if result.returncode == 0:
                return f"Successfully installed {package}"
            else:
                return f"Failed to install {package}: {result.stderr}"
        except Exception as e:
            return f"Installation error: {str(e)}"
    
    def show_help(self):
        """Display help menu"""
        help_text = f"""
{Fore.GREEN}KING_BLESS-XMD COMMAND MENU{Style.RESET_ALL}

{Fore.YELLOW}[ BASIC COMMANDS ]{Style.RESET_ALL}
• hello - Greet the AI
• help - Show this help menu
• time - Show current time
• date - Show current date
• clear - Clear screen
• exit - Exit program

{Fore.YELLOW}[ WEB TOOLS ]{Style.RESET_ALL}
• search [query] - Search the web
• download [url] - Download files
• weather [city] - Get weather info

{Fore.YELLOW}[ SYSTEM TOOLS ]{Style.RESET_ALL}
• install [package] - Install Termux packages
• update - Update system
• list tools - Show available tools

{Fore.YELLOW}[ SECURITY TOOLS ]{Style.RESET_ALL}
• scan network - Network scanner
• security check - System security audit

{Fore.YELLOW}[ DOWNLOAD APPS ]{Style.RESET_ALL}
• get nethunter - Download Kali Nethunter
• get termux - Download Termux apps
• get tools - Download hacking tools

Type any command to get started!
        """
        return help_text
    
    def display_response(self, response):
        """Display formatted response"""
        print(f"\n{Fore.GREEN}[KING_BLESS-XMD]{Style.RESET_ALL} {response}\n")
    
    def suggest_help(self, command):
        """Suggest help for unknown commands"""
        print(f"{Fore.RED}[!] Command '{command}' not recognized.{Style.RESET_ALL}")
        print(f"{Fore.YELLOW}[?] Type 'help' to see available commands{Style.RESET_ALL}")
        return False
    
    def start(self):
        """Start the AI assistant"""
        self.display_banner()
        print(f"{Fore.GREEN}[+] System initialized successfully!")
        print(f"[+] Type 'help' to begin{Style.RESET_ALL}\n")
        
        while True:
            try:
                user_input = input(f"{Fore.CYAN}USER@{Style.RESET_ALL}{Fore.YELLOW}KING_BLESS-XMD{Style.RESET_ALL}: ")
                
                if user_input.lower() in ['exit', 'quit', 'bye']:
                    print(f"{Fore.GREEN}Goodbye! Thank you for using KING_BLESS-XMD{Style.RESET_ALL}")
                    break
                
                self.process_command(user_input)
                
            except KeyboardInterrupt:
                print(f"\n{Fore.YELLOW}[!] Interrupted. Type 'exit' to quit.{Style.RESET_ALL}")
            except Exception as e:
                print(f"{Fore.RED}[!] Error: {e}{Style.RESET_ALL}")

if __name__ == "__main__":
    try:
        assistant = KING_BLESS_XMD()
        assistant.start()
    except KeyboardInterrupt:
        print(f"\n{Fore.YELLOW}[!] Program terminated by user.{Style.RESET_ALL}")
    except Exception as e:
        print(f"{Fore.RED}[!] Fatal error: {e}{Style.RESET_ALL}")
EOF

echo "[+] Creating web search module..."
cat > ~/KING_BLESS-XMD/modules/web_search.py << 'EOF'
#!/data/data/com.termux/files/usr/bin/python3
# Web Search Module

import requests
from bs4 import BeautifulSoup
import json

class WebSearch:
    @staticmethod
    def google_search(query):
        try:
            url = f"https://www.google.com/search?q={query}"
            headers = {
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
            }
            response = requests.get(url, headers=headers)
            soup = BeautifulSoup(response.text, 'html.parser')
            
            results = []
            for g in soup.find_all('div', class_='g'):
                title = g.find('h3')
                if title:
                    results.append(title.text)
            return results[:5]
        except Exception as e:
            return [f"Error: {str(e)}"]
    
    @staticmethod
    def get_weather(city):
        try:
            url = f"https://wttr.in/{city}?format=%C+%t+%h+%w"
            response = requests.get(url)
            return response.text
        except:
            return "Weather service unavailable"
EOF

echo "[+] Creating download manager..."
cat > ~/KING_BLESS-XMD/modules/download_tools.py << 'EOF'
#!/data/data/com.termux/files/usr/bin/python3
# Download Manager Module

import requests
import os
import subprocess

class DownloadManager:
    APPS = {
        'nethunter': 'https://kali.download/nethunter-images/',
        'termux': 'https://f-droid.org/repo/com.termux_118.apk',
        'termux-api': 'https://f-droid.org/repo/com.termux.api_51.apk',
        'metasploit': 'https://github.com/rapid7/metasploit-framework',
        'zphisher': 'https://github.com/htr-tech/zphisher',
    }
    
    @staticmethod
    def download_app(app_name):
        if app_name in DownloadManager.APPS:
            url = DownloadManager.APPS[app_name]
            filename = f"{app_name}.apk"
            
            print(f"Downloading {app_name}...")
            response = requests.get(url, stream=True)
            
            with open(filename, 'wb') as f:
                for chunk in response.iter_content(chunk_size=1024):
                    if chunk:
                        f.write(chunk)
            
            return f"Downloaded {filename}"
        else:
            return "App not available in repository"
    
    @staticmethod
    def install_app(apk_file):
        if os.path.exists(apk_file):
            subprocess.run(['termux-open', apk_file])
            return f"Installing {apk_file}..."
        else:
            return "APK file not found"
EOF

echo "[+] Creating starter script..."
cat > ~/king-bless << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
cd ~/KING_BLESS-XMD
python main.py
EOF

chmod +x ~/king-bless
chmod +x ~/KING_BLESS-XMD/main.py

echo "[+] Creating update script..."
cat > ~/KING_BLESS-XMD/update.sh << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
echo "[+] Updating KING_BLESS-XMD..."
cd ~/KING_BLESS-XMD
git pull origin main
pip install -r requirements.txt
echo "[+] Update complete!"
EOF

chmod +x ~/KING_BLESS-XMD/update.sh

echo "[+] Creating requirements.txt..."
cat > ~/KING_BLESS-XMD/requirements.txt << 'EOF'
requests>=2.28.0
beautifulsoup4>=4.11.0
selenium>=4.0.0
flask>=2.0.0
transformers>=4.20.0
torch>=1.12.0
colorama>=0.4.0
pyfiglet>=0.8.post1
EOF

echo "[+] Setting up web server..."
cat > ~/KING_BLESS-XMD/web/start_web.sh << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
echo "[+] Starting KING_BLESS-XMD Web Interface..."
cd ~/KING_BLESS-XMD/web
php -S localhost:8080
EOF

chmod +x ~/KING_BLESS-XMD/web/start_web.sh

echo "[+] Creating quick start alias..."
echo "alias kingbless='cd ~/KING_BLESS-XMD && python main.py'" >> ~/.bashrc
echo "alias bless-web='cd ~/KING_BLESS-XMD/web && php -S localhost:8080'" >> ~/.bashrc

echo "[+] Installation complete!"
echo ""
echo "════════════════════════════════════════════════════════════"
echo "   KING_BLESS-XMD AI Assistant Installation Complete!"
echo "════════════════════════════════════════════════════════════"
echo ""
echo "To start the AI assistant, type:"
echo "    ${GREEN}kingbless${NC}"
echo ""
echo "To start the web interface, type:"
echo "    ${GREEN}bless-web${NC}"
echo ""
echo "Then open browser to: ${YELLOW}http://localhost:8080${NC}"
echo ""
echo "Type 'help' in the AI interface to see all commands"
echo ""
echo "════════════════════════════════════════════════════════════"
echo "        Created by Kingsley Nyarko - All rights reserved"
echo "════════════════════════════════════════════════════════════"
EOF
