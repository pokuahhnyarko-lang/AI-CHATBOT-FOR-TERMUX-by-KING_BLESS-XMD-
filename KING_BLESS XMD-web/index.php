<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KING_BLESS-XMD AI Assistant</title>
    <style>
        :root {
            --primary: #1a1a2e;
            --secondary: #16213e;
            --accent: #0f3460;
            --neon: #00ff88;
            --text: #e6e6e6;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: var(--text);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            overflow-x: hidden;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        header {
            text-align: center;
            padding: 40px 0;
            border-bottom: 2px solid var(--neon);
            margin-bottom: 40px;
            position: relative;
        }
        
        .logo {
            font-size: 3.5em;
            font-weight: bold;
            background: linear-gradient(45deg, var(--neon), #00ccff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 0 15px rgba(0, 255, 136, 0.3);
            margin-bottom: 15px;
        }
        
        .tagline {
            font-size: 1.2em;
            opacity: 0.9;
            margin-bottom: 10px;
        }
        
        .developer {
            color: var(--neon);
            font-weight: bold;
        }
        
        .main-content {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            margin-bottom: 40px;
        }
        
        .card {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            padding: 25px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(0, 255, 136, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0, 255, 136, 0.1);
        }
        
        .card h2 {
            color: var(--neon);
            margin-bottom: 20px;
            font-size: 1.8em;
            border-bottom: 2px solid var(--neon);
            padding-bottom: 10px;
        }
        
        .feature-list {
            list-style: none;
        }
        
        .feature-list li {
            padding: 10px 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            display: flex;
            align-items: center;
        }
        
        .feature-list li:before {
            content: "▸";
            color: var(--neon);
            margin-right: 10px;
            font-weight: bold;
        }
        
        .download-section {
            background: rgba(0, 255, 136, 0.1);
            padding: 25px;
            border-radius: 15px;
            margin-bottom: 40px;
        }
        
        .download-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        
        .download-btn {
            background: linear-gradient(45deg, var(--accent), var(--primary));
            border: 2px solid var(--neon);
            color: var(--neon);
            padding: 15px;
            border-radius: 10px;
            text-decoration: none;
            text-align: center;
            font-weight: bold;
            transition: all 0.3s;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .download-btn:hover {
            background: var(--neon);
            color: var(--primary);
            transform: scale(1.05);
        }
        
        .terminal {
            background: #000;
            border-radius: 10px;
            padding: 20px;
            font-family: 'Courier New', monospace;
            color: var(--neon);
            min-height: 300px;
            overflow-y: auto;
        }
        
        .terminal-line {
            margin-bottom: 10px;
        }
        
        .prompt {
            color: #00ccff;
        }
        
        .command {
            color: var(--neon);
        }
        
        footer {
            text-align: center;
            padding: 30px 0;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            margin-top: 40px;
        }
        
        @media (max-width: 768px) {
            .main-content {
                grid-template-columns: 1fr;
            }
            
            .logo {
                font-size: 2.5em;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <div class="logo">KING_BLESS-XMD</div>
            <div class="tagline">Advanced AI Assistant for Termux</div>
            <div class="developer">Created by Kingsley Nyarko</div>
            <div class="version">Version 2.0</div>
        </header>
        
        <div class="main-content">
            <div class="card">
                <h2>🤖 AI Features</h2>
                <ul class="feature-list">
                    <li>Natural Language Processing</li>
                    <li>Web Search Integration</li>
                    <li>Real-time Information</li>
                    <li>Command Execution</li>
                    <li>System Monitoring</li>
                    <li>Security Scanning</li>
                    <li>File Management</li>
                    <li>Network Tools</li>
                </ul>
            </div>
            
            <div class="card">
                <h2>🛠️ System Tools</h2>
                <ul class="feature-list">
                    <li>Termux Package Manager</li>
                    <li>Network Scanner</li>
                    <li>Security Auditing</li>
                    <li>File Downloader</li>
                    <li>Process Manager</li>
                    <li>System Information</li>
                    <li>Web Server</li>
                    <li>Database Management</li>
                </ul>
            </div>
        </div>
        
        <div class="download-section">
            <h2>📱 Download APKs & Tools</h2>
            <div class="download-grid">
                <a href="https://termux.com" class="download-btn" target="_blank">
                    <span>Termux</span>
                    <small>v0.118</small>
                </a>
                
                <a href="https://kali.org/nethunter" class="download-btn" target="_blank">
                    <span>Kali Nethunter</span>
                    <small>2023.4</small>
                </a>
                
                <a href="https://metasploit.com" class="download-btn" target="_blank">
                    <span>Metasploit</span>
                    <small>v6.2</small>
                </a>
                
                <a href="https://nmap.org" class="download-btn" target="_blank">
                    <span>Nmap</span>
                    <small>v7.93</small>
                </a>
                
                <a href="install.sh" class="download-btn" download>
                    <span>KING_BLESS-XMD</span>
                    <small>Installer Script</small>
                </a>
                
                <a href="https://github.com" class="download-btn" target="_blank">
                    <span>More Tools</span>
                    <small>GitHub Repo</small>
                </a>
            </div>
        </div>
        
        <div class="card">
            <h2>💻 Live Terminal Demo</h2>
            <div class="terminal" id="terminal">
                <div class="terminal-line">
                    <span class="prompt">user@king-bless-xmd:~$</span> 
                    <span class="command">./install.sh</span>
                </div>
                <div class="terminal-line">[+] Installing KING_BLESS-XMD AI Assistant...</div>
                <div class="terminal-line">[✓] System initialized successfully!</div>
                <div class="terminal-line">
                    <span class="prompt">user@king-bless-xmd:~$</span> 
                    <span class="command">help</span>
                </div>
                <div class="terminal-line">Available commands: search, install, scan, download, info</div>
                <div class="terminal-line">
                    <span class="prompt">user@king-bless-xmd:~$</span> 
                    <span class="command" id="current-command"></span>
                </div>
            </div>
        </div>
        
        <div class="card">
            <h2>🚀 Quick Installation</h2>
            <pre style="background: #000; padding: 15px; border-radius: 10px; overflow-x: auto;">
# Copy and paste in Termux:
pkg update && pkg upgrade
pkg install git
git clone https://github.com/your-repo/KING_BLESS-XMD.git
cd KING_BLESS-XMD
chmod +x install.sh
./install.sh
            </pre>
        </div>
    </div>
    
    <footer>
        <p>&copy; 2024 KING_BLESS-XMD AI Assistant. Created by Kingsley Nyarko.</p>
        <p>For educational purposes only. Use responsibly.</p>
        <p style="margin-top: 20px;">
            <a href="#" style="color: var(--neon); margin: 0 10px;">GitHub</a> |
            <a href="#" style="color: var(--neon); margin: 0 10px;">Documentation</a> |
            <a href="#" style="color: var(--neon); margin: 0 10px;">Support</a> |
            <a href="#" style="color: var(--neon); margin: 0 10px;">Contact</a>
        </p>
    </footer>

    <script>
        // Terminal typing effect
        const commands = [
            'search kali linux tools',
            'install metasploit',
            'scan network',
            'get nethunter',
            'system info'
        ];
        
        let cmdIndex = 0;
        let charIndex = 0;
        const commandElement = document.getElementById('current-command');
        
        function typeCommand() {
            if (cmdIndex < commands.length) {
                if (charIndex < commands[cmdIndex].length) {
                    commandElement.textContent += commands[cmdIndex].charAt(charIndex);
                    charIndex++;
                    setTimeout(typeCommand, 100);
                } else {
                    setTimeout(() => {
                        commandElement.textContent = '';
                        charIndex = 0;
                        cmdIndex = (cmdIndex + 1) % commands.length;
                        setTimeout(typeCommand, 1000);
                    }, 2000);
                }
            }
        }
        
        // Start typing effect
        setTimeout(typeCommand, 1000);
        
        // Download counter
        const downloadButtons = document.querySelectorAll('.download-btn');
        downloadButtons.forEach(btn => {
            btn.addEventListener('click', function(e) {
                if(this.getAttribute('href') === 'install.sh') {
                    e.preventDefault();
                    alert('Downloading installer... Check your downloads folder.');
                }
            });
        });
    </script>
</body>
</html>
