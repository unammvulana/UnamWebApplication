<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UnamWebApplication._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .hero-section {
            min-height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            position: relative;
            overflow: hidden;
        }
        
        .hero-led {
            font-size: 4rem;
            font-weight: 900;
            text-align: center;
            background: linear-gradient(45deg, #00ffff, #ff00ff, #ffff00, #00ff00, #ff0080);
            background-size: 400% 400%;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            animation: heroGlow 4s ease-in-out infinite, heroColorShift 6s linear infinite;
            text-shadow: 0 0 30px rgba(255, 255, 255, 0.6),
                        0 0 60px rgba(255, 255, 255, 0.4),
                        0 0 90px rgba(255, 255, 255, 0.2);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            letter-spacing: 3px;
            line-height: 1.2;
            margin-bottom: 2rem;
        }
        
        @keyframes heroGlow {
            0%, 100% { 
                text-shadow: 0 0 30px rgba(255, 255, 255, 0.6),
                            0 0 60px rgba(255, 255, 255, 0.4),
                            0 0 90px rgba(255, 255, 255, 0.2);
            }
            50% { 
                text-shadow: 0 0 40px rgba(255, 255, 255, 0.9),
                            0 0 80px rgba(255, 255, 255, 0.6),
                            0 0 120px rgba(255, 255, 255, 0.4),
                            0 0 160px rgba(255, 255, 255, 0.2);
            }
        }
        
        @keyframes heroColorShift {
            0% { filter: hue-rotate(0deg); }
            100% { filter: hue-rotate(360deg); }
        }
        
        .hero-subtitle {
            color: #ffffff;
            font-size: 1.5rem;
            text-align: center;
            margin-bottom: 3rem;
            opacity: 0.9;
            font-weight: 300;
        }
        
        .role-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }
        
        .role-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 2rem;
            text-align: center;
            transition: all 0.3s ease;
            cursor: pointer;
        }
        
        .role-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
            background: rgba(255, 255, 255, 0.15);
        }
        
        .role-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
            background: linear-gradient(45deg, #00ffff, #ff00ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .role-title {
            color: #ffffff;
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1rem;
        }
        
        .role-description {
            color: rgba(255, 255, 255, 0.8);
            line-height: 1.6;
        }
        
        .floating-shapes {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            pointer-events: none;
        }
        
        .shape {
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation: floatShape 20s infinite linear;
        }
        
        @keyframes floatShape {
            0% { transform: translateY(0) rotate(0deg); }
            100% { transform: translateY(-1000px) rotate(360deg); }
        }

        /* HR Manager specific styles */
        .hr-manager-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 2rem;
            text-align: center;
            transition: all 0.3s ease;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }

        .hr-manager-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
            background: rgba(255, 255, 255, 0.15);
        }

        .hr-manager-card::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255, 215, 0, 0.1), transparent);
            transform: rotate(45deg);
            transition: all 0.6s ease;
        }

        .hr-manager-card:hover::before {
            animation: goldShine 1.5s ease-in-out;
        }

        @keyframes goldShine {
            0% { transform: translateX(-100%) translateY(-100%) rotate(45deg); }
            100% { transform: translateX(100%) translateY(100%) rotate(45deg); }
        }

        .hr-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
            background: linear-gradient(45deg, #FFD700, #FFA500, #FF8C00);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            animation: goldGlow 2s ease-in-out infinite alternate;
        }

        @keyframes goldGlow {
            0% { 
                filter: drop-shadow(0 0 5px rgba(255, 215, 0, 0.5));
                transform: scale(1);
            }
            100% { 
                filter: drop-shadow(0 0 20px rgba(255, 215, 0, 0.8));
                transform: scale(1.1);
            }
        }

        .hr-title {
            color: #FFD700;
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1rem;
            text-shadow: 0 0 10px rgba(255, 215, 0, 0.5);
        }

        .hr-description {
            color: rgba(255, 255, 255, 0.8);
            line-height: 1.6;
        }

        /* Responsive grid adjustments */
        @media (max-width: 1200px) {
            .role-cards {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 768px) {
            .role-cards {
                grid-template-columns: 1fr;
            }
            
            .hero-led {
                font-size: 2.5rem;
            }
            
            .hero-subtitle {
                font-size: 1.2rem;
            }
        }
    </style>

    <div class="hero-section">
        <div class="floating-shapes" id="shapesContainer"></div>
        <div class="container text-center">
            <div class="led-container" style="background: transparent; box-shadow: none;">
                <div class="led-welcome hero-led">
                    🌟 Welcome to the Institutional Monthly Claim Management System 🌟
                </div>
            </div>
            <p class="hero-subtitle">
                Streamlining Academic Workflows with Precision and Excellence
            </p>
            
            <div class="role-cards">
                <div class="role-card" onclick="location.href='Lecture_Page'">
                    <div class="role-icon">👨‍🏫</div>
                    <div class="role-title">Lecturer Portal</div>
                    <p class="role-description">Submit and track your monthly claims with real-time status updates and automated calculations.</p>
                </div>
                
                <div class="role-card" onclick="location.href='Programme-CO-Ordinator Page'">
                    <div class="role-icon">👨‍💼</div>
                    <div class="role-title">Programme Coordinator</div>
                    <p class="role-description">Review and verify lecturer claims with comprehensive oversight and approval workflows.</p>
                </div>
                
                <div class="role-card" onclick="location.href='Academic Manager Page'">
                    <div class="role-icon">👨‍🎓</div>
                    <div class="role-title">Academic Manager</div>
                    <p class="role-description">Final approval authority with institutional oversight and comprehensive reporting.</p>
                </div>

                <!-- NEW HR MANAGER CARD -->
                <div class="hr-manager-card" onclick="location.href='HR-Manager'">
                    <div class="hr-icon">💼</div>
                    <div class="hr-title">HR Manager</div>
                    <p class="hr-description">Manage lecturer data, process payments, generate reports, and oversee HR operations with advanced automation tools.</p>
                </div>
            </div>
        </div>
    </div>

    <script>
        function createShapes() {
            const container = document.getElementById('shapesContainer');
            const shapes = ['circle', 'square', 'triangle'];
            const colors = ['rgba(0, 255, 255, 0.1)', 'rgba(255, 0, 255, 0.1)', 'rgba(255, 255, 0, 0.1)'];

            for (let i = 0; i < 15; i++) {
                const shape = document.createElement('div');
                shape.className = 'shape';
                shape.style.width = Math.random() * 100 + 50 + 'px';
                shape.style.height = shape.style.width;
                shape.style.background = colors[Math.floor(Math.random() * colors.length)];
                shape.style.left = Math.random() * 100 + '%';
                shape.style.top = Math.random() * 100 + 100 + '%';
                shape.style.animationDelay = Math.random() * 20 + 's';
                shape.style.animationDuration = (15 + Math.random() * 20) + 's';
                container.appendChild(shape);
            }
        }

        function createParticles() {
            const container = document.querySelector('.led-container');
            if (container) {
                for (let i = 0; i < 20; i++) {
                    const particle = document.createElement('div');
                    particle.className = 'particle';
                    particle.style.left = Math.random() * 100 + '%';
                    particle.style.animationDelay = Math.random() * 6 + 's';
                    particle.style.animationDuration = (3 + Math.random() * 4) + 's';
                    container.appendChild(particle);
                }
            }
        }

        document.addEventListener('DOMContentLoaded', function () {
            createShapes();
            createParticles();

            // Add click effects for HR Manager card
            const hrCard = document.querySelector('.hr-manager-card');
            if (hrCard) {
                hrCard.addEventListener('click', function () {
                    // Add a ripple effect
                    const ripple = document.createElement('div');
                    ripple.style.position = 'absolute';
                    ripple.style.borderRadius = '50%';
                    ripple.style.background = 'radial-gradient(circle, rgba(255,215,0,0.3) 0%, transparent 70%)';
                    ripple.style.transform = 'scale(0)';
                    ripple.style.animation = 'ripple 0.6s linear';
                    ripple.style.width = '100%';
                    ripple.style.height = '100%';
                    ripple.style.top = '0';
                    ripple.style.left = '0';

                    this.style.position = 'relative';
                    this.appendChild(ripple);

                    setTimeout(() => {
                        ripple.remove();
                    }, 600);
                });
            }
        });

        // Add CSS for ripple effect
        const style = document.createElement('style');
        style.textContent = `
            @keyframes ripple {
                to {
                    transform: scale(4);
                    opacity: 0;
                }
            }
        `;
        document.head.appendChild(style);
    </script>
</asp:Content>