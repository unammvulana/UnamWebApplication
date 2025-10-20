<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="UnamWebApplication.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Quantum Universe Background */
        .quantum-universe {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: 
                radial-gradient(circle at 20% 35%, rgba(0, 100, 255, 0.3) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(255, 0, 150, 0.3) 0%, transparent 50%),
                radial-gradient(circle at 40% 80%, rgba(0, 255, 200, 0.3) 0%, transparent 50%),
                linear-gradient(135deg, #000428 0%, #004e92 100%);
            z-index: -3;
            animation: universePulse 8s ease-in-out infinite;
        }

        @keyframes universePulse {
            0%, 100% { opacity: 0.8; }
            50% { opacity: 1; }
        }

        /* Neural Network Grid */
        .neural-grid {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: 
                linear-gradient(rgba(0, 255, 255, 0.1) 1px, transparent 1px),
                linear-gradient(90deg, rgba(0, 255, 255, 0.1) 1px, transparent 1px);
            background-size: 60px 60px;
            animation: neuralFlow 15s linear infinite;
            z-index: -2;
        }

        @keyframes neuralFlow {
            0% { 
                background-position: 0 0;
                filter: hue-rotate(0deg);
            }
            100% { 
                background-position: 60px 60px;
                filter: hue-rotate(360deg);
            }
        }

        /* Quantum Particles */
        .quantum-particles {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -1;
        }

        .quantum-dot {
            position: absolute;
            width: 4px;
            height: 4px;
            background: radial-gradient(circle, #00ffff, transparent);
            border-radius: 50%;
            animation: quantumFloat 20s infinite linear;
            box-shadow: 0 0 15px #00ffff;
        }

        @keyframes quantumFloat {
            0% {
                transform: translate(0, 0) scale(0.3);
                opacity: 0;
            }
            10% {
                opacity: 1;
                transform: scale(1.2);
            }
            90% {
                opacity: 1;
            }
            100% {
                transform: translate(200px, -150px) scale(0.2);
                opacity: 0;
            }
        }

        /* Main Container */
        .universe-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 40px 20px;
            position: relative;
            z-index: 2;
        }

        /* Cosmic Hero Section */
        .cosmic-hero {
            text-align: center;
            margin: 100px 0;
            position: relative;
        }

        .cosmic-title {
            font-size: 5.5rem;
            font-weight: 900;
            background: linear-gradient(45deg, 
                #00ffff, #ff00ff, #ffff00, #00ff00,
                #ff0000, #0000ff, #00ffff);
            background-size: 400% 400%;
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            animation: cosmicRainbow 6s ease infinite;
            margin-bottom: 30px;
            text-shadow: 
                0 0 40px rgba(0, 255, 255, 0.9),
                0 0 80px rgba(255, 0, 255, 0.7),
                0 0 120px rgba(255, 255, 0, 0.5);
            line-height: 1.1;
        }

        @keyframes cosmicRainbow {
            0%, 100% { background-position: 0% 50%; }
            25% { background-position: 100% 25%; }
            50% { background-position: 50% 100%; }
            75% { background-position: 25% 0%; }
        }

        .cosmic-subtitle {
            font-size: 2.2rem;
            color: #ffffff;
            font-weight: 300;
            margin-bottom: 50px;
            text-shadow: 0 0 25px rgba(0, 255, 255, 0.8);
            opacity: 0.95;
            line-height: 1.4;
        }

        /* Mission Statement */
        .mission-statement {
            background: linear-gradient(135deg, 
                rgba(255, 255, 255, 0.12) 0%, 
                rgba(255, 255, 255, 0.08) 100%);
            backdrop-filter: blur(40px);
            border-radius: 35px;
            padding: 70px 60px;
            margin: 80px 0;
            border: 2px solid rgba(255, 255, 255, 0.15);
            box-shadow: 
                0 40px 120px rgba(0, 0, 0, 0.4),
                inset 0 1px 0 rgba(255, 255, 255, 0.3);
            position: relative;
            overflow: hidden;
        }

        .mission-statement::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, 
                transparent, 
                rgba(255, 255, 255, 0.1), 
                transparent);
            transition: 0.8s;
        }

        .mission-statement:hover::before {
            left: 100%;
        }

        .mission-title {
            font-size: 3rem;
            font-weight: 800;
            background: linear-gradient(45deg, #00ffff, #ff00ff);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            text-align: center;
            margin-bottom: 40px;
            text-shadow: 3px 3px 8px rgba(0, 0, 0, 0.3);
        }

        .mission-text {
            font-size: 1.4rem;
            color: #ffffff;
            line-height: 1.9;
            text-align: center;
            font-weight: 400;
            opacity: 0.95;
        }

        .highlight {
            background: linear-gradient(45deg, #ffff00, #00ff00);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            font-weight: 700;
            text-shadow: 0 0 20px rgba(255, 255, 0, 0.5);
        }

        /* System Workflow Section */
        .workflow-section {
            margin: 100px 0;
        }

        .workflow-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(450px, 1fr));
            gap: 50px;
        }

        .workflow-card {
            background: linear-gradient(135deg, 
                rgba(255, 255, 255, 0.95) 0%, 
                rgba(255, 255, 255, 0.88) 100%);
            backdrop-filter: blur(30px);
            border-radius: 30px;
            padding: 50px 40px;
            box-shadow: 
                0 35px 100px rgba(0, 0, 0, 0.3),
                0 20px 60px rgba(0, 0, 0, 0.2),
                inset 0 2px 0 rgba(255, 255, 255, 0.8);
            border: 2px solid rgba(255, 255, 255, 0.6);
            transition: all 0.6s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            position: relative;
            overflow: hidden;
        }

        .workflow-card:hover {
            transform: translateY(-25px) scale(1.03);
            box-shadow: 
                0 50px 140px rgba(0, 0, 0, 0.4),
                0 30px 80px rgba(0, 0, 0, 0.3);
        }

        .workflow-icon {
            font-size: 4.5rem;
            margin-bottom: 30px;
            text-align: center;
            filter: drop-shadow(0 15px 25px rgba(0, 0, 0, 0.3));
        }

        .workflow-title {
            font-size: 2rem;
            font-weight: 800;
            background: linear-gradient(45deg, #2c3e50, #3498db, #9b59b6);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            margin-bottom: 25px;
            text-align: center;
            line-height: 1.3;
        }

        .workflow-description {
            font-size: 1.2rem;
            color: #2c3e50;
            line-height: 1.8;
            text-align: center;
            font-weight: 500;
        }

        /* Features Section */
        .features-section {
            background: linear-gradient(135deg, 
                rgba(0, 255, 0, 0.15) 0%, 
                rgba(0, 200, 255, 0.12) 100%);
            backdrop-filter: blur(35px);
            border-radius: 40px;
            padding: 80px 60px;
            margin: 100px 0;
            border: 3px solid rgba(0, 255, 255, 0.3);
            box-shadow: 
                0 50px 150px rgba(0, 255, 255, 0.3),
                inset 0 1px 0 rgba(255, 255, 255, 0.6);
            position: relative;
            overflow: hidden;
        }

        .features-title {
            font-size: 3.5rem;
            font-weight: 900;
            background: linear-gradient(45deg, #00ff00, #00ffff, #0080ff);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            text-align: center;
            margin-bottom: 50px;
            text-shadow: 4px 4px 10px rgba(0, 0, 0, 0.3);
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 40px;
            margin-top: 50px;
        }

        .feature-item {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            border-radius: 25px;
            padding: 35px 30px;
            border: 1px solid rgba(255, 255, 255, 0.3);
            text-align: center;
            transition: all 0.4s ease;
        }

        .feature-item:hover {
            transform: translateY(-10px);
            background: rgba(255, 255, 255, 0.15);
            box-shadow: 0 25px 60px rgba(0, 255, 255, 0.2);
        }

        .feature-icon {
            font-size: 3rem;
            margin-bottom: 20px;
            filter: drop-shadow(0 10px 20px rgba(0, 0, 0, 0.3));
        }

        .feature-name {
            font-size: 1.4rem;
            font-weight: 700;
            color: #ffffff;
            margin-bottom: 15px;
        }

        .feature-detail {
            font-size: 1.1rem;
            color: rgba(255, 255, 255, 0.9);
            line-height: 1.6;
        }

        /* Benefits Section */
        .benefits-section {
            margin: 100px 0;
        }

        .benefits-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
            gap: 45px;
        }

        .benefit-card {
            background: linear-gradient(135deg, 
                rgba(255, 255, 255, 0.12) 0%, 
                rgba(255, 255, 255, 0.08) 100%);
            backdrop-filter: blur(25px);
            border-radius: 30px;
            padding: 45px 35px;
            border: 2px solid rgba(255, 255, 255, 0.2);
            transition: all 0.5s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            position: relative;
            overflow: hidden;
        }

        .benefit-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, 
                transparent, 
                rgba(255, 255, 255, 0.1), 
                transparent);
            transition: 0.6s;
        }

        .benefit-card:hover::before {
            left: 100%;
        }

        .benefit-card:hover {
            transform: translateY(-15px);
            box-shadow: 
                0 35px 100px rgba(0, 0, 0, 0.4),
                0 20px 60px rgba(0, 0, 0, 0.3);
            border-color: rgba(0, 255, 255, 0.4);
        }

        .benefit-title {
            font-size: 1.8rem;
            font-weight: 800;
            background: linear-gradient(45deg, #ffff00, #ff00ff);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            margin-bottom: 25px;
            text-align: center;
        }

        .benefit-list {
            list-style: none;
            padding: 0;
        }

        .benefit-item {
            font-size: 1.1rem;
            margin-bottom: 15px;
            padding-left: 25px;
            position: relative;
            line-height: 1.6;
            opacity: 1;
            font-weight: 600;
        }

        /* Strong Colors for Benefit Items */
        .lecturer-benefit {
            color: #00ffff !important;
            text-shadow: 0 0 10px #00ffff, 0 0 20px #00ffff;
        }

        .coordinator-benefit {
            color: #000000 !important;
            text-shadow: 0 0 10px #ffffff, 0 0 20px #ffffff;
            font-weight: 700;
        }

        .institution-benefit {
            color: #ff00ff !important;
            text-shadow: 0 0 10px #ff00ff, 0 0 20px #ff00ff;
        }

        .benefit-item::before {
            content: '⚡';
            position: absolute;
            left: 0;
            text-shadow: 0 0 10px currentColor;
        }

        .lecturer-benefit::before {
            color: #00ffff;
        }

        .coordinator-benefit::before {
            color: #000000;
            text-shadow: 0 0 10px #ffffff;
        }

        .institution-benefit::before {
            color: #ff00ff;
        }

        /* Developer Vision */
        .developer-vision {
            background: linear-gradient(135deg, 
                rgba(255, 0, 150, 0.15) 0%, 
                rgba(150, 0, 255, 0.12) 100%);
            backdrop-filter: blur(40px);
            border-radius: 40px;
            padding: 80px 60px;
            margin: 100px 0;
            border: 3px solid rgba(255, 0, 150, 0.3);
            box-shadow: 
                0 50px 150px rgba(255, 0, 150, 0.3),
                inset 0 1px 0 rgba(255, 255, 255, 0.6);
            text-align: center;
        }

        .vision-title {
            font-size: 3.2rem;
            font-weight: 900;
            background: linear-gradient(45deg, #ff00ff, #ff0000, #ffff00);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            margin-bottom: 30px;
            text-shadow: 4px 4px 10px rgba(0, 0, 0, 0.3);
        }

        .developer-name {
            font-size: 2.8rem;
            font-weight: 800;
            color: #ffffff;
            margin-bottom: 15px;
            text-shadow: 0 0 20px rgba(255, 255, 255, 0.7);
        }

        .developer-location {
            font-size: 1.5rem;
            color: rgba(255, 255, 255, 0.9);
            margin-bottom: 40px;
            font-style: italic;
        }

        .vision-statement {
            font-size: 1.4rem;
            color: #ffffff;
            line-height: 1.9;
            max-width: 900px;
            margin: 0 auto;
            font-weight: 400;
            opacity: 0.95;
        }

        /* Floating Cyber Elements */
        .cyber-elements {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 1;
        }

        .cyber-element {
            position: absolute;
            font-size: 2.5rem;
            opacity: 0.1;
            animation: cyberFloat 25s infinite linear;
            text-shadow: 0 0 20px currentColor;
        }

        @keyframes cyberFloat {
            0% {
                transform: translate(0, 0) rotate(0deg) scale(0.8);
            }
            25% {
                transform: translate(150px, 100px) rotate(90deg) scale(1.2);
            }
            50% {
                transform: translate(80px, 200px) rotate(180deg) scale(0.9);
            }
            75% {
                transform: translate(-50px, 150px) rotate(270deg) scale(1.1);
            }
            100% {
                transform: translate(0, 0) rotate(360deg) scale(0.8);
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .cosmic-title {
                font-size: 3rem;
            }
            
            .cosmic-subtitle {
                font-size: 1.6rem;
            }
            
            .mission-title {
                font-size: 2.2rem;
            }
            
            .workflow-grid,
            .benefits-grid {
                grid-template-columns: 1fr;
            }
            
            .features-title {
                font-size: 2.5rem;
            }
            
            .vision-title {
                font-size: 2.3rem;
            }
            
            .mission-statement,
            .features-section,
            .developer-vision {
                padding: 40px 30px;
                margin: 50px 0;
            }
        }
    </style>

    <!-- Background Elements -->
    <div class="quantum-universe"></div>
    <div class="neural-grid"></div>
    <div class="quantum-particles" id="quantumParticles"></div>
    <div class="cyber-elements" id="cyberElements"></div>

    <div class="universe-container">
        <!-- Cosmic Hero Section -->
        <div class="cosmic-hero">
            <h1 class="cosmic-title">
                INSTITUTIONAL<br>CLAIM MANAGEMENT<br>SYSTEM
            </h1>
            <p class="cosmic-subtitle">
                Streamlining Academic Claim Processes Through<br>Digital Workflow Automation
            </p>
        </div>

        <!-- Mission Statement -->
        <div class="mission-statement">
            <h2 class="mission-title">OUR MISSION</h2>
            <p class="mission-text">
                The <span class="highlight">Institutional Monthly Claim Management System</span> is designed to 
                <span class="highlight">solve critical administrative challenges</span> faced by educational institutions. 
                By digitizing and automating the entire claim submission and approval workflow, we eliminate manual processes, 
                reduce processing delays, and provide complete transparency. This system serves as the 
                <span class="highlight">ultimate problem solver</span> for institutions struggling with claim management inefficiencies, 
                helping them focus on their core educational mission while we handle the administrative complexity.
            </p>
        </div>

        <!-- System Workflow Section -->
        <div class="workflow-section">
            <h2 class="mission-title" style="color: white; text-align: center; margin-bottom: 60px;">HOW THE SYSTEM WORKS</h2>
            <div class="workflow-grid">
                <div class="workflow-card">
                    <div class="workflow-icon">👨‍🏫</div>
                    <h3 class="workflow-title">Lecturer Submission</h3>
                    <p class="workflow-description">
                        Lecturers submit claims with detailed information including module codes, hours worked, hourly rates, 
                        and comprehensive descriptions. The system automatically calculates total amounts and provides real-time 
                        form validation to ensure accuracy.
                    </p>
                </div>

                <div class="workflow-card">
                    <div class="workflow-icon">👨‍💼</div>
                    <h3 class="workflow-title">Coordinator Review</h3>
                    <p class="workflow-description">
                        Programme Coordinators review submitted claims, providing recommendations for approval or rejection. 
                        They can export pending claims for offline review and track all claim statuses in real-time through 
                        their dedicated dashboard.
                    </p>
                </div>

                <div class="workflow-card">
                    <div class="workflow-icon">👨‍💻</div>
                    <h3 class="workflow-title">Manager Approval</h3>
                    <p class="workflow-description">
                        Academic Managers make final decisions on all claims, considering coordinator recommendations. 
                        They have complete oversight of the approval workflow and can export comprehensive reports for 
                        institutional record-keeping and analysis.
                    </p>
                </div>

                <div class="workflow-card">
                    <div class="workflow-icon">📊</div>
                    <h3 class="workflow-title">Status Tracking</h3>
                    <p class="workflow-description">
                        Lecturers can track their claim status in real-time, viewing coordinator recommendations and 
                        final manager decisions. The system maintains complete audit trails and provides instant status 
                        updates across all user roles.
                    </p>
                </div>
            </div>
        </div>

        <!-- Features Section -->
        <div class="features-section">
            <h2 class="features-title">SYSTEM FEATURES</h2>
            <p class="mission-text" style="color: rgba(255,255,255,0.95); margin-bottom: 50px;">
                Built with modern web technologies and user-friendly design, our system provides comprehensive claim management capabilities 
                tailored for educational institutions of all sizes.
            </p>

            <div class="features-grid">
                <div class="feature-item">
                    <div class="feature-icon">📝</div>
                    <h3 class="feature-name">Claim Submission</h3>
                    <p class="feature-detail">Easy-to-use forms with automatic amount calculation and real-time validation</p>
                </div>

                <div class="feature-item">
                    <div class="feature-icon">🔄</div>
                    <h3 class="feature-name">Workflow Management</h3>
                    <p class="feature-detail">Multi-level approval process with coordinator recommendations and final manager decisions</p>
                </div>

                <div class="feature-item">
                    <div class="feature-icon">📋</div>
                    <h3 class="feature-name">Status Tracking</h3>
                    <p class="feature-detail">Real-time status updates for lecturers with complete visibility into approval progress</p>
                </div>

                <div class="feature-item">
                    <div class="feature-icon">📤</div>
                    <h3 class="feature-name">Export Capabilities</h3>
                    <p class="feature-detail">Export claims data to Excel for offline review and institutional reporting</p>
                </div>

                <div class="feature-item">
                    <div class="feature-icon">⚡</div>
                    <h3 class="feature-name">Real-time Updates</h3>
                    <p class="feature-detail">Automatic status synchronization across all user interfaces every 2 seconds</p>
                </div>

                <div class="feature-item">
                    <div class="feature-icon">🎯</div>
                    <h3 class="feature-name">Role-based Access</h3>
                    <p class="feature-detail">Dedicated interfaces for Lecturers, Coordinators, and Academic Managers</p>
                </div>
            </div>
        </div>

        <!-- Benefits Section -->
        <div class="benefits-section">
            <h2 class="mission-title" style="color: white; text-align: center; margin-bottom: 60px;">KEY BENEFITS</h2>
            <div class="benefits-grid">
                <div class="benefit-card">
                    <h3 class="benefit-title">For Lecturers</h3>
                    <ul class="benefit-list">
                        <li class="benefit-item lecturer-benefit">Simple and intuitive claim submission process</li>
                        <li class="benefit-item lecturer-benefit">Real-time tracking of claim status</li>
                        <li class="benefit-item lecturer-benefit">Automatic amount calculations</li>
                        <li class="benefit-item lecturer-benefit">Instant form validation</li>
                        <li class="benefit-item lecturer-benefit">Clear visibility into approval workflow</li>
                    </ul>
                </div>

                <div class="benefit-card">
                    <h3 class="benefit-title">For Coordinators</h3>
                    <ul class="benefit-list">
                        <li class="benefit-item coordinator-benefit">Centralized claim review dashboard</li>
                        <li class="benefit-item coordinator-benefit">Easy approval/recommendation system</li>
                        <li class="benefit-item coordinator-benefit">Export functionality for offline work</li>
                        <li class="benefit-item coordinator-benefit">Real-time queue management</li>
                        <li class="benefit-item coordinator-benefit">Comprehensive claim information</li>
                    </ul>
                </div>

                <div class="benefit-card">
                    <h3 class="benefit-title">For Institutions</h3>
                    <ul class="benefit-list">
                        <li class="benefit-item institution-benefit">Streamlined administrative processes</li>
                        <li class="benefit-item institution-benefit">Reduced processing time and delays</li>
                        <li class="benefit-item institution-benefit">Complete audit trails</li>
                        <li class="benefit-item institution-benefit">Digital record keeping</li>
                        <li class="benefit-item institution-benefit">Improved transparency and accountability</li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Developer Vision -->
        <div class="developer-vision">
            <h2 class="vision-title">SYSTEM ARCHITECT</h2>
            <p class="developer-name">UNAM MVULANA</p>
            <p class="developer-location">Eastern Cape, Mount Fletcher</p>
            <p class="vision-statement">
                As the developer of this comprehensive claim management system, I created this solution to address real 
                administrative challenges faced by educational institutions. The system leverages modern web technologies 
                to provide a seamless, efficient, and transparent claim management process. My goal is to help institutions 
                streamline their administrative workflows, reduce processing times, and provide better service to their 
                academic staff through intelligent digital solutions.
            </p>
        </div>
    </div>

    <script>
        // Create quantum particles
        function createQuantumParticles() {
            const container = document.getElementById('quantumParticles');
            const particleCount = 200;

            for (let i = 0; i < particleCount; i++) {
                const particle = document.createElement('div');
                particle.className = 'quantum-dot';

                const left = Math.random() * 100;
                const top = Math.random() * 100;
                const delay = Math.random() * 30;
                const duration = 15 + Math.random() * 25;
                const color = getQuantumColor();

                particle.style.left = left + 'vw';
                particle.style.top = top + 'vh';
                particle.style.animationDelay = delay + 's';
                particle.style.animationDuration = duration + 's';
                particle.style.background = color;
                particle.style.boxShadow = `0 0 15px ${color}`;

                container.appendChild(particle);
            }
        }

        function getQuantumColor() {
            const colors = [
                'radial-gradient(circle, #00ffff, transparent)',
                'radial-gradient(circle, #ff00ff, transparent)',
                'radial-gradient(circle, #ffff00, transparent)',
                'radial-gradient(circle, #00ff00, transparent)'
            ];
            return colors[Math.floor(Math.random() * colors.length)];
        }

        // Create cyber elements
        function createCyberElements() {
            const container = document.getElementById('cyberElements');
            const elements = ['⚡', '🔮', '💎', '🌟', '🎯', '🚀', '💻', '🔒'];
            const elementCount = 25;

            for (let i = 0; i < elementCount; i++) {
                const element = document.createElement('div');
                element.className = 'cyber-element';
                element.textContent = elements[Math.floor(Math.random() * elements.length)];

                const left = Math.random() * 100;
                const top = Math.random() * 100;
                const delay = Math.random() * 20;
                const duration = 20 + Math.random() * 20;
                const color = getCyberColor();

                element.style.left = left + 'vw';
                element.style.top = top + 'vh';
                element.style.animationDelay = delay + 's';
                element.style.animationDuration = duration + 's';
                element.style.color = color;

                container.appendChild(element);
            }
        }

        function getCyberColor() {
            const colors = ['#00ffff', '#ff00ff', '#ffff00', '#00ff00', '#ff0000', '#0000ff'];
            return colors[Math.floor(Math.random() * colors.length)];
        }

        // Initialize everything
        window.onload = function () {
            createQuantumParticles();
            createCyberElements();

            // Add scroll animations
            const observerOptions = {
                threshold: 0.1,
                rootMargin: '0px 0px -50px 0px'
            };

            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.style.opacity = '1';
                        entry.target.style.transform = 'translateY(0)';
                    }
                });
            }, observerOptions);

            // Observe elements for animation
            document.querySelectorAll('.workflow-card, .benefit-card, .feature-item').forEach(el => {
                el.style.opacity = '0';
                el.style.transform = 'translateY(50px)';
                el.style.transition = 'opacity 0.8s ease, transform 0.8s ease';
                observer.observe(el);
            });

            // Continuous background animations
            setInterval(() => {
                document.querySelector('.cosmic-title').style.animation = 'none';
                setTimeout(() => {
                    document.querySelector('.cosmic-title').style.animation = 'cosmicRainbow 6s ease infinite';
                }, 10);
            }, 12000);
        }

        // Add parallax effect
        window.addEventListener('scroll', () => {
            const scrolled = window.pageYOffset;
            const rate = scrolled * -0.3;
            document.querySelector('.quantum-universe').style.transform = `translateY(${rate}px)`;
        });

        // Add interactive effects
        document.querySelectorAll('.workflow-card, .benefit-card').forEach(card => {
            card.addEventListener('mouseenter', function () {
                this.style.zIndex = '10';
            });

            card.addEventListener('mouseleave', function () {
                this.style.zIndex = '1';
            });
        });
    </script>
</asp:Content> 