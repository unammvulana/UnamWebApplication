<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="UnamWebApplication.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Ultimate LED Effects */
        .led-master-container {
            position: relative;
            margin: 40px auto;
            padding: 30px;
            max-width: 1000px;
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            border-radius: 25px;
            box-shadow: 
                0 0 60px rgba(0, 255, 255, 0.6),
                0 0 100px rgba(255, 0, 255, 0.4),
                inset 0 0 50px rgba(255, 255, 255, 0.1);
            overflow: hidden;
            border: 3px solid #00ffff;
            animation: containerGlow 4s ease-in-out infinite alternate;
        }

        @keyframes containerGlow {
            0% {
                box-shadow: 
                    0 0 60px rgba(0, 255, 255, 0.6),
                    0 0 100px rgba(255, 0, 255, 0.4),
                    inset 0 0 50px rgba(255, 255, 255, 0.1);
            }
            100% {
                box-shadow: 
                    0 0 80px rgba(255, 0, 255, 0.8),
                    0 0 120px rgba(0, 255, 255, 0.6),
                    inset 0 0 60px rgba(255, 255, 255, 0.2);
            }
        }

        .led-main-title {
            font-size: 3.5rem;
            font-weight: 900;
            text-align: center;
            color: transparent;
            background: linear-gradient(45deg, #00ffff, #ff00ff, #ffff00, #00ff00);
            background-size: 300% 300%;
            -webkit-background-clip: text;
            background-clip: text;
            animation: rainbowText 3s ease infinite;
            text-shadow: 
                0 0 20px rgba(0, 255, 255, 0.8),
                0 0 40px rgba(255, 0, 255, 0.6),
                0 0 60px rgba(255, 255, 0, 0.4);
            margin-bottom: 10px;
            letter-spacing: 2px;
        }

        .led-subtitle {
            font-size: 1.5rem;
            font-weight: 600;
            text-align: center;
            color: #ffffff;
            text-shadow: 0 0 10px rgba(0, 255, 255, 0.7);
            margin-bottom: 20px;
            opacity: 0.9;
        }

        @keyframes rainbowText {
            0%, 100% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
        }

        /* Dynamic Background */
        .dynamic-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(-45deg, 
                #ff0000, #ff8000, #ffff00, #80ff00, 
                #00ff00, #00ff80, #00ffff, #0080ff, 
                #0000ff, #8000ff, #ff00ff, #ff0080);
            background-size: 1200% 1200%;
            animation: gradientShift 15s ease infinite;
            z-index: -3;
            opacity: 0.4;
        }

        @keyframes gradientShift {
            0% {
                background-position: 0% 50%;
            }
            25% {
                background-position: 50% 100%;
            }
            50% {
                background-position: 100% 50%;
            }
            75% {
                background-position: 50% 0%;
            }
            100% {
                background-position: 0% 50%;
            }
        }

        /* Quantum Particles */
        .quantum-field {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -2;
        }

        .quantum-particle {
            position: absolute;
            border-radius: 50%;
            animation: quantumFloat 8s infinite linear;
            filter: blur(1px);
            opacity: 0.7;
        }

        .particle-1 {
            width: 8px;
            height: 8px;
            background: radial-gradient(circle, #ff0000, transparent);
            box-shadow: 0 0 20px #ff0000;
        }

        .particle-2 {
            width: 6px;
            height: 6px;
            background: radial-gradient(circle, #00ff00, transparent);
            box-shadow: 0 0 15px #00ff00;
        }

        .particle-3 {
            width: 10px;
            height: 10px;
            background: radial-gradient(circle, #0000ff, transparent);
            box-shadow: 0 0 25px #0000ff;
        }

        .particle-4 {
            width: 7px;
            height: 7px;
            background: radial-gradient(circle, #ffff00, transparent);
            box-shadow: 0 0 18px #ffff00;
        }

        .particle-5 {
            width: 5px;
            height: 5px;
            background: radial-gradient(circle, #ff00ff, transparent);
            box-shadow: 0 0 12px #ff00ff;
        }

        @keyframes quantumFloat {
            0% {
                transform: translateY(100vh) translateX(0) rotate(0deg) scale(0.3);
                opacity: 0;
            }
            10% {
                opacity: 0.8;
                transform: scale(1.2);
            }
            90% {
                opacity: 0.8;
            }
            100% {
                transform: translateY(-100px) translateX(100px) rotate(360deg) scale(0.2);
                opacity: 0;
            }
        }

        /* Professional Form Design */
        .form-super-container {
            max-width: 650px;
            margin: 50px auto;
            position: relative;
            z-index: 2;
        }

        .form-cyber-card {
            background: linear-gradient(135deg, 
                rgba(255, 255, 255, 0.95) 0%, 
                rgba(255, 255, 255, 0.88) 100%);
            backdrop-filter: blur(20px);
            border-radius: 25px;
            padding: 40px 35px;
            box-shadow: 
                0 25px 80px rgba(0, 0, 0, 0.25),
                0 8px 25px rgba(0, 0, 0, 0.15),
                inset 0 1px 0 rgba(255, 255, 255, 0.6);
            border: 1px solid rgba(255, 255, 255, 0.4);
            position: relative;
            overflow: hidden;
        }

        .form-cyber-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, 
                transparent, 
                rgba(255, 255, 255, 0.4), 
                transparent);
            transition: 0.5s;
        }

        .form-cyber-card:hover::before {
            left: 100%;
        }

        .form-title-elite {
            text-align: center;
            font-size: 2.2rem;
            font-weight: 800;
            background: linear-gradient(45deg, #2c3e50, #3498db);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }

        .form-subtitle {
            text-align: center;
            color: #7f8c8d;
            font-size: 1.1rem;
            margin-bottom: 35px;
            font-weight: 500;
        }

        /* Form Elements */
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 0;
        }

        .form-group-pro {
            margin-bottom: 25px;
            position: relative;
        }

        .form-label-pro {
            display: block;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 10px;
            font-size: 1rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .form-control-pro {
            width: 100%;
            padding: 16px 20px;
            border: 2px solid #e9ecef;
            border-radius: 15px;
            font-size: 1rem;
            transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            background: rgba(255, 255, 255, 0.9);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
        }

        .form-control-pro:focus {
            border-color: #3498db;
            box-shadow: 
                0 0 0 4px rgba(52, 152, 219, 0.15),
                0 8px 25px rgba(52, 152, 219, 0.2);
            transform: translateY(-3px);
            background: rgba(255, 255, 255, 1);
        }

        .textarea-pro {
            min-height: 130px;
            resize: vertical;
            line-height: 1.5;
        }

        /* Validation Styles */
        .validation-pro {
            color: #e74c3c;
            font-size: 0.85rem;
            margin-top: 8px;
            display: none;
            animation: validationSlide 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            font-weight: 600;
        }

        @keyframes validationSlide {
            from {
                opacity: 0;
                transform: translateX(-20px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .form-control-pro.error {
            border-color: #e74c3c;
            box-shadow: 0 0 0 4px rgba(231, 76, 60, 0.15);
        }

        .form-control-pro.success {
            border-color: #27ae60;
            box-shadow: 0 0 0 4px rgba(39, 174, 96, 0.15);
        }

        /* Submit Button */
        .btn-cyber-submit {
            background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
            color: white;
            border: none;
            padding: 18px 50px;
            border-radius: 15px;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            display: block;
            margin: 35px auto 0;
            box-shadow: 
                0 10px 30px rgba(52, 152, 219, 0.4),
                0 6px 10px rgba(52, 152, 219, 0.3);
            position: relative;
            overflow: hidden;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .btn-cyber-submit::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, 
                transparent, 
                rgba(255, 255, 255, 0.4), 
                transparent);
            transition: 0.6s;
        }

        .btn-cyber-submit:hover::before {
            left: 100%;
        }

        .btn-cyber-submit:hover {
            transform: translateY(-5px) scale(1.02);
            box-shadow: 
                0 15px 40px rgba(52, 152, 219, 0.6),
                0 10px 20px rgba(52, 152, 219, 0.4);
            background: linear-gradient(135deg, #2980b9 0%, #3498db 100%);
        }

        .btn-cyber-submit:active {
            transform: translateY(-2px) scale(1);
        }

        /* Contact Info Section */
        .contact-elite-info {
            text-align: center;
            margin: 50px auto;
            padding: 40px;
            max-width: 600px;
            background: linear-gradient(135deg, 
                rgba(52, 152, 219, 0.12) 0%, 
                rgba(155, 89, 182, 0.08) 100%);
            backdrop-filter: blur(15px);
            border-radius: 25px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
        }

        .phone-elite {
            font-size: 2.5rem;
            font-weight: 800;
            color: #2c3e50;
            margin: 25px 0;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
            background: linear-gradient(45deg, #2c3e50, #3498db);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        .email-elite-link {
            display: inline-block;
            background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
            color: white;
            padding: 18px 35px;
            border-radius: 15px;
            text-decoration: none;
            font-weight: 700;
            margin: 20px 0;
            transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            box-shadow: 0 10px 30px rgba(231, 76, 60, 0.4);
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .email-elite-link:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 15px 40px rgba(231, 76, 60, 0.6);
            color: white;
            text-decoration: none;
        }

        /* Success Message */
        .success-elite {
            background: linear-gradient(135deg, #27ae60 0%, #2ecc71 100%);
            color: white;
            padding: 30px;
            border-radius: 20px;
            text-align: center;
            margin: 30px 0;
            display: none;
            animation: eliteFadeIn 0.6s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            box-shadow: 0 15px 40px rgba(39, 174, 96, 0.4);
        }

        @keyframes eliteFadeIn {
            from {
                opacity: 0;
                transform: translateY(-30px) scale(0.9);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .led-main-title {
                font-size: 2.5rem;
            }
            
            .led-subtitle {
                font-size: 1.2rem;
            }
            
            .form-cyber-card {
                padding: 30px 25px;
                margin: 20px;
            }
            
            .form-title-elite {
                font-size: 1.8rem;
            }
            
            .phone-elite {
                font-size: 2rem;
            }
            
            .btn-cyber-submit {
                padding: 16px 40px;
            }
            
            .form-row {
                grid-template-columns: 1fr;
                gap: 0;
            }
        }

        /* Background Enhancement */
        .cyber-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: 
                radial-gradient(circle at 20% 80%, rgba(52, 152, 219, 0.15) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(155, 89, 182, 0.15) 0%, transparent 50%),
                radial-gradient(circle at 40% 40%, rgba(231, 76, 60, 0.1) 0%, transparent 50%);
            z-index: -1;
            animation: backgroundPulse 8s ease-in-out infinite;
        }

        @keyframes backgroundPulse {
            0%, 100% {
                opacity: 0.6;
            }
            50% {
                opacity: 0.9;
            }
        }

        /* Floating Shapes */
        .floating-shapes {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -2;
        }

        .floating-shape {
            position: absolute;
            opacity: 0.1;
            animation: floatShape 20s infinite linear;
        }

        .shape-1 {
            width: 100px;
            height: 100px;
            background: linear-gradient(45deg, #ff0000, #ff8000);
            border-radius: 30% 70% 70% 30% / 30% 30% 70% 70%;
            top: 10%;
            left: 10%;
        }

        .shape-2 {
            width: 150px;
            height: 150px;
            background: linear-gradient(45deg, #00ff00, #00ffff);
            border-radius: 60% 40% 30% 70% / 60% 30% 70% 40%;
            top: 60%;
            left: 80%;
        }

        .shape-3 {
            width: 80px;
            height: 80px;
            background: linear-gradient(45deg, #0000ff, #8000ff);
            border-radius: 50% 50% 50% 50% / 60% 60% 40% 40%;
            top: 80%;
            left: 20%;
        }

        @keyframes floatShape {
            0% {
                transform: translate(0, 0) rotate(0deg);
            }
            25% {
                transform: translate(100px, 50px) rotate(90deg);
            }
            50% {
                transform: translate(50px, 100px) rotate(180deg);
            }
            75% {
                transform: translate(-50px, 50px) rotate(270deg);
            }
            100% {
                transform: translate(0, 0) rotate(360deg);
            }
        }
    </style>

    <!-- Dynamic Background -->
    <div class="dynamic-background"></div>

    <!-- Cyber Background Overlay -->
    <div class="cyber-background"></div>

    <!-- Floating Shapes -->
    <div class="floating-shapes">
        <div class="floating-shape shape-1"></div>
        <div class="floating-shape shape-2"></div>
        <div class="floating-shape shape-3"></div>
    </div>

    <!-- Quantum Particles Field -->
    <div class="quantum-field" id="quantumField"></div>

    <div class="container-fluid">
        <!-- Ultimate LED Header -->
        <div class="led-master-container">
            <div class="led-main-title">
                INSTITUTIONAL MONTHLY CLAIM MANAGEMENT SYSTEM
            </div>
            <div class="led-subtitle">
                 Digital Platform for Academic Institutions
            </div>
        </div>

        <!-- Elite Contact Information -->
        <div class="contact-elite-info">
            <h3 style="color: #2c3e50; margin-bottom: 25px; font-size: 1.8rem; font-weight: 700;">🚀 GET IN TOUCH</h3>
            <p style="font-size: 1.2rem; color: #555; margin-bottom: 20px; line-height: 1.6;">
                Ready to transform your institution's claim management process?<br>
                Contact us for demonstrations and implementation.
            </p>
            <div class="phone-elite">📱 O66 428 3871</div>
            <p style="color: #666; margin: 25px 0; font-size: 1.1rem;">
                Direct feedback and system rating:
            </p>
            <a href="mailto:uunastar@gmail.com?subject=Institutional%20Claim%20Management%20System%20Rating&body=Dear%20System%20Administrator,%0A%0AI%20would%20like%20to%20provide%20feedback%20about%20the%20Institutional%20Monthly%20Claim%20Management%20System.%0A%0AOverall%20Rating:%0ASuggestions:%0AComments:%0A%0A" 
               class="email-elite-link">
                ⭐ RATE & REVIEW SYSTEM
            </a>
        </div>

        <!-- Professional Contact Form -->
        <div class="form-super-container">
            <div class="form-cyber-card">
                <h2 class="form-title-elite">SYSTEM FEEDBACK FORM</h2>
                <p class="form-subtitle">Share your experience and help us improve</p>
                
                <!-- Success Message -->
                <div id="successElite" class="success-elite">
                    <h4 style="margin-bottom: 10px;">🎉 FEEDBACK SUBMITTED!</h4>
                    <p style="margin: 0; opacity: 0.9;">Thank you for your valuable input. Your email client will open shortly.</p>
                </div>

                <!-- Name Fields in Row -->
                <div class="form-row">
                    <div class="form-group-pro">
                        <label class="form-label-pro">First Name *</label>
                        <input type="text" id="txtFirstName" class="form-control-pro" placeholder="Enter your first name" />
                        <div id="firstNameValidation" class="validation-pro">Please enter your first name</div>
                    </div>

                    <div class="form-group-pro">
                        <label class="form-label-pro">Surname *</label>
                        <input type="text" id="txtSurname" class="form-control-pro" placeholder="Enter your surname" />
                        <div id="surnameValidation" class="validation-pro">Please enter your surname</div>
                    </div>
                </div>

                <div class="form-group-pro">
                    <label class="form-label-pro">Email Address *</label>
                    <input type="email" id="txtEmail" class="form-control-pro" placeholder="Enter your email address" />
                    <div id="emailValidation" class="validation-pro">Please enter a valid email address</div>
                </div>

                <div class="form-group-pro">
                    <label class="form-label-pro">Institution</label>
                    <input type="text" id="txtInstitution" class="form-control-pro" placeholder="Your institution name (optional)" />
                </div>

                <div class="form-group-pro">
                    <label class="form-label-pro">Your Feedback *</label>
                    <textarea id="txtMessage" class="form-control-pro textarea-pro" 
                              placeholder="Share your experience, suggestions, or rate specific features..."></textarea>
                    <div id="messageValidation" class="validation-pro">Please share your feedback</div>
                </div>

                <div class="form-group-pro">
                    <label class="form-label-pro">Overall Rating</label>
                    <select id="ddlRating" class="form-control-pro">
                        <option value="">Select your rating</option>
                        <option value="5">★★★★★ Exceptional</option>
                        <option value="4">★★★★☆ Excellent</option>
                        <option value="3">★★★☆☆ Good</option>
                        <option value="2">★★☆☆☆ Fair</option>
                        <option value="1">★☆☆☆☆ Needs Improvement</option>
                    </select>
                </div>

                <button type="button" id="btnSubmitElite" class="btn-cyber-submit" onclick="submitEliteFeedback()">
                    📧 SEND FEEDBACK & OPEN EMAIL
                </button>
            </div>
        </div>
    </div>

    <script>
        // Create quantum particles
        function createQuantumParticles() {
            const field = document.getElementById('quantumField');
            const particleCount = 120;

            for (let i = 0; i < particleCount; i++) {
                const particle = document.createElement('div');

                // Random particle type
                const particleType = Math.floor(Math.random() * 5) + 1;
                particle.className = `quantum-particle particle-${particleType}`;

                // Random properties
                const left = Math.random() * 100;
                const delay = Math.random() * 15;
                const duration = 8 + Math.random() * 8;

                particle.style.left = left + 'vw';
                particle.style.animationDelay = delay + 's';
                particle.style.animationDuration = duration + 's';

                field.appendChild(particle);
            }
        }

        // Enhanced validation
        function validateFieldPro(field, validationDiv) {
            const value = field.value.trim();

            if (value === '') {
                field.classList.add('error');
                field.classList.remove('success');
                validationDiv.style.display = 'block';
                return false;
            }

            if (field.type === 'email') {
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(value)) {
                    field.classList.add('error');
                    field.classList.remove('success');
                    validationDiv.style.display = 'block';
                    validationDiv.textContent = 'Please enter a valid email address';
                    return false;
                }
            }

            field.classList.remove('error');
            field.classList.add('success');
            validationDiv.style.display = 'none';
            return true;
        }

        function validateFormPro() {
            const firstNameField = document.getElementById('txtFirstName');
            const surnameField = document.getElementById('txtSurname');
            const emailField = document.getElementById('txtEmail');
            const messageField = document.getElementById('txtMessage');

            const firstNameValid = validateFieldPro(firstNameField, document.getElementById('firstNameValidation'));
            const surnameValid = validateFieldPro(surnameField, document.getElementById('surnameValidation'));
            const emailValid = validateFieldPro(emailField, document.getElementById('emailValidation'));
            const messageValid = validateFieldPro(messageField, document.getElementById('messageValidation'));

            return firstNameValid && surnameValid && emailValid && messageValid;
        }

        // Real-time validation with enhanced UX
        document.querySelectorAll('.form-control-pro').forEach(field => {
            field.addEventListener('input', function () {
                if (this.value.trim() !== '') {
                    this.classList.remove('error');
                    this.classList.add('success');
                }
            });

            field.addEventListener('blur', function () {
                const validationMap = {
                    'txtFirstName': 'firstNameValidation',
                    'txtSurname': 'surnameValidation',
                    'txtEmail': 'emailValidation',
                    'txtMessage': 'messageValidation'
                };

                if (validationMap[this.id]) {
                    validateFieldPro(this, document.getElementById(validationMap[this.id]));
                }
            });
        });

        // Elite feedback submission
        function submitEliteFeedback() {
            if (validateFormPro()) {
                const firstName = document.getElementById('txtFirstName').value;
                const surname = document.getElementById('txtSurname').value;
                const email = document.getElementById('txtEmail').value;
                const institution = document.getElementById('txtInstitution').value;
                const message = document.getElementById('txtMessage').value;
                const rating = document.getElementById('ddlRating').value;

                // Create comprehensive mailto link
                let mailtoLink = 'mailto:uunastar@gmail.com?';
                mailtoLink += 'subject=' + encodeURIComponent(`System Feedback from ${firstName} ${surname}${institution ? ` - ${institution}` : ''}`);
                mailtoLink += '&body=' + encodeURIComponent(
                    `INSTITUTIONAL CLAIM MANAGEMENT SYSTEM FEEDBACK\n` +
                    `============================================\n\n` +
                    `Name: ${firstName} ${surname}\n` +
                    `Email: ${email}\n` +
                    `Institution: ${institution || 'Not provided'}\n` +
                    `Overall Rating: ${rating ? getRatingTextPro(rating) : 'Not rated'}\n\n` +
                    `FEEDBACK DETAILS:\n${message}\n\n` +
                    `---\nThis feedback was submitted through the system's contact form\n` +
                    `Timestamp: ${new Date().toLocaleString()}`
                );

                // Show elite success message
                const successElite = document.getElementById('successElite');
                successElite.style.display = 'block';

                // Add celebration effect
                celebrateSubmission();

                // Reset form
                setTimeout(() => {
                    document.getElementById('txtFirstName').value = '';
                    document.getElementById('txtSurname').value = '';
                    document.getElementById('txtEmail').value = '';
                    document.getElementById('txtInstitution').value = '';
                    document.getElementById('txtMessage').value = '';
                    document.getElementById('ddlRating').value = '';

                    // Remove success classes
                    document.querySelectorAll('.form-control-pro').forEach(input => {
                        input.classList.remove('success');
                    });
                }, 1000);

                // Open email client
                setTimeout(() => {
                    window.location.href = mailtoLink;
                }, 1500);

                // Hide success message after 8 seconds
                setTimeout(() => {
                    successElite.style.display = 'none';
                }, 8000);
            } else {
                // Scroll to first error with smooth animation
                const firstError = document.querySelector('.form-control-pro.error');
                if (firstError) {
                    firstError.scrollIntoView({
                        behavior: 'smooth',
                        block: 'center'
                    });

                    // Add shake animation to error field
                    firstError.style.animation = 'none';
                    setTimeout(() => {
                        firstError.style.animation = 'validationSlide 0.4s ease';
                    }, 10);
                }
            }
        }

        function getRatingTextPro(rating) {
            const ratings = {
                '5': '★★★★★ Exceptional',
                '4': '★★★★☆ Excellent',
                '3': '★★★☆☆ Good',
                '2': '★★☆☆☆ Fair',
                '1': '★☆☆☆☆ Needs Improvement'
            };
            return ratings[rating] || 'Not rated';
        }

        // Celebration effect
        function celebrateSubmission() {
            const button = document.getElementById('btnSubmitElite');
            button.innerHTML = '🎉 THANK YOU! 🎉';
            button.style.background = 'linear-gradient(135deg, #27ae60 0%, #2ecc71 100%)';

            setTimeout(() => {
                button.innerHTML = '📧 SEND FEEDBACK & OPEN EMAIL';
                button.style.background = 'linear-gradient(135deg, #3498db 0%, #2980b9 100%)';
            }, 2000);
        }

        // Initialize everything when page loads
        window.onload = function () {
            createQuantumParticles();

            // Add continuous LED title animation
            setInterval(() => {
                const title = document.querySelector('.led-main-title');
                title.style.animation = 'none';
                setTimeout(() => {
                    title.style.animation = 'rainbowText 3s ease infinite';
                }, 10);
            }, 10000);

            // Add interactive background effects
            document.addEventListener('mousemove', (e) => {
                const particles = document.querySelectorAll('.quantum-particle');
                particles.forEach(particle => {
                    const rect = particle.getBoundingClientRect();
                    const particleX = rect.left + rect.width / 2;
                    const particleY = rect.top + rect.height / 2;
                    const distance = Math.sqrt(
                        Math.pow(e.clientX - particleX, 2) +
                        Math.pow(e.clientY - particleY, 2)
                    );

                    if (distance < 100) {
                        particle.style.transform = `scale(1.5)`;
                        setTimeout(() => {
                            particle.style.transform = `scale(1)`;
                        }, 300);
                    }
                });
            });
        }

        // Add typing effect for cyber feel
        document.addEventListener('DOMContentLoaded', function () {
            const subtitle = document.querySelector('.form-subtitle');
            const originalText = subtitle.textContent;
            subtitle.textContent = '';
            let i = 0;

            const typeWriter = () => {
                if (i < originalText.length) {
                    subtitle.textContent += originalText.charAt(i);
                    i++;
                    setTimeout(typeWriter, 40);
                }
            };

            setTimeout(typeWriter, 1000);
        });
    </script>
</asp:Content>