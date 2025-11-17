<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HR-Manager.aspx.cs" Inherits="UnamWebApplication.HR_Manager" MasterPageFile="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .hr-container {
            max-width: 1600px;
            margin: 0 auto;
            padding: 20px;
        }
      
        .dashboard-section, .automation-section, .lecturer-management-section {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
      
        .section-title {
            color: #2c3e50;
            font-size: 1.8rem;
            font-weight: 600;
            margin-bottom: 25px;
            border-bottom: 3px solid #f39c12;
            padding-bottom: 10px;
        }
      
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
      
        .dashboard-card {
            background: linear-gradient(135deg, #f39c12, #e67e22);
            color: white;
            padding: 25px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(243, 156, 18, 0.3);
            transition: transform 0.3s ease;
        }
      
        .dashboard-card:hover {
            transform: translateY(-5px);
        }
      
        .card-value {
            font-size: 2.5rem;
            font-weight: 700;
            margin: 10px 0;
        }
      
        .card-label {
            font-size: 1rem;
            opacity: 0.9;
        }
      
        .btn-hr {
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            font-weight: 600;
            transition: all 0.3s ease;
            margin: 5px;
            cursor: pointer;
            font-size: 0.9rem;
            white-space: nowrap;
        }
      
        .btn-generate { background: #27ae60; color: white; }
        .btn-process { background: #3498db; color: white; }
        .btn-export { background: #9b59b6; color: white; }
        .btn-edit { background: #f39c12; color: white; }
        .btn-save { background: #2ecc71; color: white; }
        .btn-cancel { background: #95a5a6; color: white; }
        .btn-delete { background: #e74c3c; color: white; }
      
        .btn-hr:hover {
            transform: translateY(-2px);
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2);
        }
      
        .table-container {
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            max-height: 600px;
            overflow: auto;
            margin-bottom: 20px;
        }
      
        .table {
            width: 100%;
            margin-bottom: 0;
            table-layout: auto;
            min-width: 1200px;
        }
      
        .table th {
            background: linear-gradient(45deg, #f39c12, #e67e22);
            color: white;
            border: none;
            padding: 15px 12px;
            font-weight: 600;
            position: sticky;
            top: 0;
            z-index: 10;
            white-space: nowrap;
            text-align: center;
        }
      
        .table td {
            padding: 12px;
            vertical-align: middle;
            border-color: #e9ecef;
            white-space: nowrap;
            text-align: center;
        }
      
        .action-cell {
            white-space: nowrap;
            position: sticky;
            right: 0;
            background: inherit;
            z-index: 5;
        }
      
        .status-badge {
            padding: 8px 12px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.85rem;
        }
      
        .status-pending { background: #fff3cd; color: #856404; }
        .status-approved { background: #d4edda; color: #155724; }
        .status-rejected { background: #f8d7da; color: #721c24; }
        .status-paid { background: #d1ecf1; color: #0c5460; }
      
        .alert-message {
            padding: 15px;
            border-radius: 8px;
            margin: 15px 0;
            display: none;
            animation: slideIn 0.5s ease-out;
        }
      
        .alert-success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
      
        .alert-error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
      
        .empty-state {
            text-align: center;
            padding: 40px;
            color: #6c757d;
        }
      
        .empty-state i {
            font-size: 3rem;
            margin-bottom: 15px;
            opacity: 0.5;
        }
      
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            flex-wrap: wrap;
            gap: 15px;
        }
      
        .action-buttons {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }
      
        .description-text {
            white-space: normal;
            word-wrap: break-word;
            max-width: 200px;
            margin: 0 auto;
            line-height: 1.4;
        }
      
        /* Professional scrollbar styling */
        .table-container::-webkit-scrollbar {
            width: 12px;
            height: 12px;
        }
      
        .table-container::-webkit-scrollbar-track {
            background: #f8f9fa;
            border-radius: 6px;
        }
      
        .table-container::-webkit-scrollbar-thumb {
            background: #f39c12;
            border-radius: 6px;
            border: 2px solid #f8f9fa;
        }
      
        .table-container::-webkit-scrollbar-thumb:hover {
            background: #e67e22;
        }
      
        /* Action buttons container */
        .action-buttons-container {
            display: flex;
            flex-wrap: nowrap;
            gap: 8px;
            justify-content: center;
        }
      
        /* Modal styles for lecturer editing */
        .modal-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            align-items: center;
            justify-content: center;
        }
      
        .modal-content {
            background: white;
            border-radius: 12px;
            width: 90%;
            max-width: 600px;
            max-height: 90vh;
            overflow-y: auto;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            animation: modalFadeIn 0.3s ease-out;
        }
      
        @keyframes modalFadeIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }
      
        .modal-header {
            padding: 20px 25px;
            border-bottom: 1px solid #e9ecef;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
      
        .modal-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: #2c3e50;
            margin: 0;
        }
      
        .modal-close {
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
            color: #6c757d;
        }
      
        .modal-body {
            padding: 25px;
        }
      
        .modal-footer {
            padding: 15px 25px;
            border-top: 1px solid #e9ecef;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }
      
        .form-group {
            margin-bottom: 20px;
        }
      
        .form-label {
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 8px;
            display: block;
        }
      
        .form-control {
            border: 2px solid #e9ecef;
            border-radius: 8px;
            padding: 12px 15px;
            transition: all 0.3s ease;
            width: 100%;
            box-sizing: border-box;
        }
      
        .form-control:focus {
            border-color: #f39c12;
            box-shadow: 0 0 0 0.2rem rgba(243, 156, 18, 0.25);
        }
      
        .form-row {
            display: flex;
            gap: 15px;
            margin-bottom: 15px;
        }
      
        .form-col {
            flex: 1;
        }
      
        .report-preview {
            background: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            margin-top: 20px;
            max-height: 300px;
            overflow-y: auto;
        }
      
        .invoice-header {
            text-align: center;
            margin-bottom: 20px;
            border-bottom: 2px solid #f39c12;
            padding-bottom: 15px;
        }
      
        .invoice-details {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 20px;
        }
      
        .invoice-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
      
        .invoice-table th, .invoice-table td {
            padding: 10px;
            border: 1px solid #dee2e6;
            text-align: left;
        }
      
        .invoice-table th {
            background-color: #f8f9fa;
        }
      
        .invoice-total {
            text-align: right;
            font-weight: bold;
            font-size: 1.2rem;
            margin-top: 15px;
        }
      
        .search-filter {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }
      
        .search-box {
            flex: 1;
            min-width: 250px;
        }
      
        .filter-select {
            min-width: 150px;
        }
    </style>
    <div class="hr-container">
        <!-- LED Welcome Banner -->
        <div class="led-container">
            <div class="led-welcome">💼 Welcome HR Manager 💼</div>
        </div>
        <!-- Alert Messages -->
        <div id="alertMessage" class="alert-message"></div>
        <!-- Dashboard Section -->
        <div class="dashboard-section">
            <h3 class="section-title">HR Dashboard</h3>
            <div class="dashboard-cards">
                <div class="dashboard-card">
                    <div class="card-label">Total Approved Claims</div>
                    <div class="card-value" id="totalApprovedClaims">0</div>
                    <div class="card-label">Ready for Payment</div>
                </div>
                <div class="dashboard-card">
                    <div class="card-label">Total Lecturers</div>
                    <div class="card-value" id="totalLecturers">0</div>
                    <div class="card-label">In System</div>
                </div>
                <div class="dashboard-card">
                    <div class="card-label">Pending Payments</div>
                    <div class="card-value" id="pendingPayments">0</div>
                    <div class="card-label">This Month</div>
                </div>
                <div class="dashboard-card">
                    <div class="card-label">Total Paid</div>
                    <div class="card-value" id="totalPaid">R 0.00</div>
                    <div class="card-label">This Month</div>
                </div>
            </div>
        </div>
        <!-- Automation Section -->
        <div class="automation-section">
            <div class="section-header">
                <h3 class="section-title">Payment Processing Automation</h3>
                <div class="action-buttons">
                    <button class="btn-hr btn-generate" onclick="generatePaymentReport()">
                        📄 Generate Payment Report
                    </button>
                    <button class="btn-hr btn-process" onclick="processBatchPayments()">
                        ⚡ Process Batch Payments
                    </button>
                    <button class="btn-hr btn-export" onclick="exportHRData()">
                        📊 Export HR Data
                    </button>
                </div>
            </div>
            <div class="search-filter">
                <input type="text" id="searchClaims" class="form-control search-box" placeholder="Search claims by ID, name, or module..." onkeyup="filterClaims()">
                <select id="statusFilter" class="form-control filter-select" onchange="filterClaims()">
                    <option value="all">All Statuses</option>
                    <option value="approved">Approved</option>
                    <option value="paid">Paid</option>
                </select>
                <select id="programmeFilter" class="form-control filter-select" onchange="filterClaims()">
                    <option value="all">All Programmes</option>
                    <option value="Computer Science">Computer Science</option>
                    <option value="Information Technology">Information Technology</option>
                    <option value="Software Engineering">Software Engineering</option>
                    <option value="Data Science">Data Science</option>
                    <option value="Cyber Security">Cyber Security</option>
                    <option value="Business Computing">Business Computing</option>
                </select>
            </div>
            <div class="table-wrapper">
                <div class="table-container">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Claim ID</th>
                                <th>Name</th>
                                <th>Surname</th>
                                <th>Employee ID</th>
                                <th>Module Code</th>
                                <th>Programme</th>
                                <th>Date</th>
                                <th>Hours</th>
                                <th>Hourly Rate</th>
                                <th>Total Amount</th>
                                <th>Manager Status</th>
                                <th>Payment Status</th>
                                <th class="action-cell">Actions</th>
                            </tr>
                        </thead>
                        <tbody id="hrClaimsBody">
                            <tr>
                                <td colspan="13" class="empty-state">
                                    <div>
                                        <i>💰</i>
                                        <h4>No Approved Claims</h4>
                                        <p>There are no approved claims ready for payment processing.</p>
                                        <p>Approved claims from Academic Managers will appear here automatically.</p>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- Lecturer Management Section -->
        <div class="lecturer-management-section">
            <div class="section-header">
                <h3 class="section-title">Lecturer Data Management</h3>
                <div class="action-buttons">
                    <button class="btn-hr btn-generate" onclick="showAddLecturerModal()">
                        ➕ Add New Lecturer
                    </button>
                </div>
            </div>
            <div class="search-filter">
                <input type="text" id="searchLecturers" class="form-control search-box" placeholder="Search lecturers by name, ID, or programme..." onkeyup="filterLecturers()">
            </div>
            <div class="table-wrapper">
                <div class="table-container">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Employee ID</th>
                                <th>Name</th>
                                <th>Surname</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Department</th>
                                <th>Programmes</th>
                                <th>Employment Type</th>
                                <th>Date Joined</th>
                                <th class="action-cell">Actions</th>
                            </tr>
                        </thead>
                        <tbody id="lecturersBody">
                            <tr>
                                <td colspan="10" class="empty-state">
                                    <div>
                                        <i>👨‍🏫</i>
                                        <h4>No Lecturer Data</h4>
                                        <p>There are no lecturers in the system yet.</p>
                                        <p>Add new lecturers using the "Add New Lecturer" button.</p>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- Back to Home Button -->
        <div class="text-center mt-4">
            <asp:HyperLink ID="btnBackHR" runat="server" Text="Back to Home" CssClass="btn-lecture" NavigateUrl="~/Default.aspx" />
        </div>
    </div>
    <!-- Payment Report Modal -->
    <div id="paymentReportModal" class="modal-overlay">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Payment Report</h3>
                <button type="button" class="modal-close" onclick="closePaymentReportModal()">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label class="form-label">Report Period</label>
                    <div class="form-row">
                        <div class="form-col">
                            <input type="date" id="reportStartDate" class="form-control">
                        </div>
                        <div class="form-col">
                            <input type="date" id="reportEndDate" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label">Report Type</label>
                    <select id="reportType" class="form-control">
                        <option value="payment">Payment Report</option>
                        <option value="invoice">Invoice Summary</option>
                        <option value="claims">Claims Analysis</option>
                    </select>
                </div>
                <div id="reportPreview" class="report-preview" style="display: none;">
                    <!-- Report preview will be generated here -->
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-hr btn-cancel" onclick="closePaymentReportModal()">Cancel</button>
                <button type="button" class="btn-hr btn-generate" onclick="previewReport()">Preview Report</button>
                <button type="button" class="btn-hr btn-export" onclick="downloadReport()" style="display: none;" id="downloadReportBtn">Download Report</button>
            </div>
        </div>
    </div>
    <!-- Lecturer Edit Modal -->
    <div id="lecturerEditModal" class="modal-overlay">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="lecturerModalTitle">Edit Lecturer</h3>
                <button type="button" class="modal-close" onclick="closeLecturerEditModal()">&times;</button>
            </div>
            <div class="modal-body">
                <input type="hidden" id="editLecturerId">
                <div class="form-row">
                    <div class="form-col">
                        <div class="form-group">
                            <label class="form-label">First Name *</label>
                            <input type="text" id="editFirstName" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-col">
                        <div class="form-group">
                            <label class="form-label">Surname *</label>
                            <input type="text" id="editSurname" class="form-control" required>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-col">
                        <div class="form-group">
                            <label class="form-label">Employee ID *</label>
                            <input type="text" id="editEmployeeId" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-col">
                        <div class="form-group">
                            <label class="form-label">Email *</label>
                            <input type="email" id="editEmail" class="form-control" required>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-col">
                        <div class="form-group">
                            <label class="form-label">Phone</label>
                            <input type="tel" id="editPhone" class="form-control">
                        </div>
                    </div>
                    <div class="form-col">
                        <div class="form-group">
                            <label class="form-label">Department</label>
                            <input type="text" id="editDepartment" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label">Programmes</label>
                    <select id="editProgrammes" class="form-control" multiple style="height: 100px;">
                        <option value="Computer Science">Computer Science</option>
                        <option value="Information Technology">Information Technology</option>
                        <option value="Software Engineering">Software Engineering</option>
                        <option value="Data Science">Data Science</option>
                        <option value="Cyber Security">Cyber Security</option>
                        <option value="Business Computing">Business Computing</option>
                    </select>
                    <small class="form-text text-muted">Hold Ctrl/Cmd to select multiple programmes</small>
                </div>
                <div class="form-row">
                    <div class="form-col">
                        <div class="form-group">
                            <label class="form-label">Employment Type</label>
                            <select id="editEmploymentType" class="form-control">
                                <option value="Full-time">Full-time</option>
                                <option value="Part-time">Part-time</option>
                                <option value="Contract">Contract</option>
                                <option value="Adjunct">Adjunct</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-col">
                        <div class="form-group">
                            <label class="form-label">Date Joined</label>
                            <input type="date" id="editDateJoined" class="form-control">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-hr btn-cancel" onclick="closeLecturerEditModal()">Cancel</button>
                <button type="button" class="btn-hr btn-delete" onclick="deleteLecturer()" id="deleteLecturerBtn" style="display: none;">Delete Lecturer</button>
                <button type="button" class="btn-hr btn-save" onclick="saveLecturer()">Save Changes</button>
            </div>
        </div>
    </div>
    <script>
        // Global variables - COMPLETELY FIXED
        var hrClaims = [];
        var lecturers = [];
        var currentEditingId = null;

        // Initialize dashboard and tables - COMPLETELY FIXED
        function initializeHRDashboard() {
            console.log("Initializing HR Dashboard...");

            // Load data from localStorage
            loadHRData();

            // Update UI
            updateDashboardStats();
            updateHRClaimsTable();
            updateLecturersTable();

            console.log("HR Dashboard initialized successfully");
            console.log("Lecturers loaded:", lecturers);
        }

        // Load HR data with PROPER error handling - FIXED
        function loadHRData() {
            try {
                console.log("Loading HR data from localStorage...");

                // Load claims data
                var storedClaims = localStorage.getItem('managerClaims');
                console.log("Stored claims:", storedClaims);

                if (storedClaims) {
                    hrClaims = JSON.parse(storedClaims);
                    console.log("Parsed claims:", hrClaims);
                } else {
                    hrClaims = [];
                    console.log("No claims found in localStorage");
                }

                // Load lecturers data - FIXED: Check multiple possible storage keys
                var storedLecturers = localStorage.getItem('hrLecturers');
                console.log("Stored lecturers from hrLecturers:", storedLecturers);

                if (!storedLecturers) {
                    // Try alternative key names
                    storedLecturers = localStorage.getItem('lecturers');
                    console.log("Stored lecturers from lecturers:", storedLecturers);
                }

                if (storedLecturers) {
                    var parsedLecturers = JSON.parse(storedLecturers);
                    console.log("Parsed lecturers:", parsedLecturers);

                    // Validate that we have proper lecturer objects
                    if (Array.isArray(parsedLecturers) && parsedLecturers.length > 0) {
                        // Check if first item has lecturer properties
                        var firstItem = parsedLecturers[0];
                        if (firstItem.employeeId || firstItem.firstName || firstItem.email) {
                            lecturers = parsedLecturers;
                            console.log("Valid lecturers data loaded:", lecturers);
                        } else {
                            console.log("Data doesn't look like lecturers, creating sample data");
                            createSampleLecturers();
                        }
                    } else {
                        console.log("Empty or invalid lecturers array, creating sample data");
                        createSampleLecturers();
                    }
                } else {
                    console.log("No lecturers found in localStorage, creating sample data");
                    createSampleLecturers();
                }

            } catch (error) {
                console.error('Error loading HR data:', error);
                // Initialize with empty arrays if there's an error
                hrClaims = [];
                lecturers = [];
                createSampleLecturers();
            }
        }

        // Create sample lecturers for testing - FIXED
        function createSampleLecturers() {
            console.log("Creating sample lecturers...");

            var sampleLecturers = [
                {
                    employeeId: "EMP001",
                    firstName: "John",
                    surname: "Smith",
                    email: "john.smith@unam.na",
                    phone: "+264 61 123 4567",
                    department: "Computer Science",
                    programmes: ["Computer Science", "Software Engineering"],
                    employmentType: "Full-time",
                    dateJoined: "2020-01-15"
                },
                {
                    employeeId: "EMP002",
                    firstName: "Sarah",
                    surname: "Johnson",
                    email: "sarah.johnson@unam.na",
                    phone: "+264 61 234 5678",
                    department: "Information Technology",
                    programmes: ["Information Technology", "Cyber Security"],
                    employmentType: "Part-time",
                    dateJoined: "2021-03-20"
                },
                {
                    employeeId: "EMP003",
                    firstName: "David",
                    surname: "Brown",
                    email: "david.brown@unam.na",
                    phone: "+264 61 345 6789",
                    department: "Data Science",
                    programmes: ["Data Science", "Business Computing"],
                    employmentType: "Contract",
                    dateJoined: "2022-06-10"
                }
            ];

            lecturers = sampleLecturers;
            localStorage.setItem('hrLecturers', JSON.stringify(lecturers));
            console.log("Sample lecturers created and saved:", lecturers);
        }

        // Update dashboard statistics
        function updateDashboardStats() {
            try {
                // Calculate statistics from claims
                var approvedClaims = hrClaims.filter(claim => claim.managerFinalStatus === 'Approved');
                var paidClaims = hrClaims.filter(claim => claim.paymentStatus === 'Paid');
                var totalPaidAmount = paidClaims.reduce((sum, claim) => sum + parseFloat(claim.totalAmount || 0), 0);

                // Update dashboard cards
                document.getElementById('totalApprovedClaims').textContent = approvedClaims.length;
                document.getElementById('totalLecturers').textContent = lecturers.length;
                document.getElementById('pendingPayments').textContent = approvedClaims.length - paidClaims.length;
                document.getElementById('totalPaid').textContent = 'R ' + totalPaidAmount.toFixed(2);
            } catch (error) {
                console.error('Error updating dashboard stats:', error);
            }
        }

        // Update HR claims table
        function updateHRClaimsTable() {
            try {
                var tbody = document.getElementById('hrClaimsBody');
                // Filter to show only approved claims
                var approvedClaims = hrClaims.filter(claim => claim.managerFinalStatus === 'Approved');

                if (approvedClaims.length === 0) {
                    tbody.innerHTML = `
                        <tr>
                            <td colspan="13" class="empty-state">
                                <div>
                                    <i>💰</i>
                                    <h4>No Approved Claims</h4>
                                    <p>There are no approved claims ready for payment processing.</p>
                                    <p>Approved claims from Academic Managers will appear here automatically.</p>
                                </div>
                            </td>
                        </tr>
                    `;
                    return;
                }

                var html = '';
                approvedClaims.forEach(function (claim) {
                    // Determine payment status
                    var paymentStatus = claim.paymentStatus || 'Pending';
                    var paymentClass = paymentStatus === 'Paid' ? 'status-paid' : 'status-pending';

                    // Action buttons
                    var actionButtons = '';
                    if (paymentStatus === 'Pending') {
                        actionButtons = `
                            <div class="action-buttons-container">
                                <button class="btn-hr btn-process" onclick="markAsPaid('${claim.claimId}')">✅ Mark as Paid</button>
                            </div>
                        `;
                    } else {
                        actionButtons = `
                            <div class="action-buttons-container">
                                <span class="status-badge status-paid">Paid</span>
                            </div>
                        `;
                    }

                    html += `
                        <tr>
                            <td>${claim.claimId || 'N/A'}</td>
                            <td>${claim.fullName || 'N/A'}</td>
                            <td>${claim.surname || 'N/A'}</td>
                            <td>${claim.employeeID || 'N/A'}</td>
                            <td>${claim.moduleCode || 'N/A'}</td>
                            <td>${claim.programme || 'N/A'}</td>
                            <td>${claim.date || 'N/A'}</td>
                            <td>${claim.hours || 'N/A'}</td>
                            <td>R${claim.hourlyRate || '0'}</td>
                            <td>R${claim.totalAmount || '0'}</td>
                            <td><span class="status-badge status-approved">${claim.managerFinalStatus || 'N/A'}</span></td>
                            <td><span class="status-badge ${paymentClass}">${paymentStatus}</span></td>
                            <td class="action-cell">
                                ${actionButtons}
                            </td>
                        </tr>
                    `;
                });

                tbody.innerHTML = html;
            } catch (error) {
                console.error('Error updating HR claims table:', error);
            }
        }

        // Filter claims based on search and filters
        function filterClaims() {
            try {
                var searchTerm = document.getElementById('searchClaims').value.toLowerCase();
                var statusFilter = document.getElementById('statusFilter').value;
                var programmeFilter = document.getElementById('programmeFilter').value;
                var tbody = document.getElementById('hrClaimsBody');
                var rows = tbody.getElementsByTagName('tr');

                for (var i = 0; i < rows.length; i++) {
                    var row = rows[i];
                    var cells = row.getElementsByTagName('td');
                    if (cells.length < 2) continue; // Skip the empty state row

                    var claimId = cells[0].textContent.toLowerCase();
                    var name = cells[1].textContent.toLowerCase();
                    var surname = cells[2].textContent.toLowerCase();
                    var moduleCode = cells[4].textContent.toLowerCase();
                    var programme = cells[5].textContent;
                    var paymentStatus = cells[11].textContent.toLowerCase();

                    var showRow = true;

                    // Apply search filter
                    if (searchTerm && !claimId.includes(searchTerm) && !name.includes(searchTerm) &&
                        !surname.includes(searchTerm) && !moduleCode.includes(searchTerm)) {
                        showRow = false;
                    }

                    // Apply status filter
                    if (statusFilter !== 'all') {
                        if (statusFilter === 'approved' && paymentStatus !== 'pending') showRow = false;
                        if (statusFilter === 'paid' && paymentStatus !== 'paid') showRow = false;
                    }

                    // Apply programme filter
                    if (programmeFilter !== 'all' && programme !== programmeFilter) {
                        showRow = false;
                    }

                    row.style.display = showRow ? '' : 'none';
                }
            } catch (error) {
                console.error('Error filtering claims:', error);
            }
        }

        // Update lecturers table - COMPLETELY FIXED
        function updateLecturersTable() {
            try {
                var tbody = document.getElementById('lecturersBody');
                console.log("Updating lecturers table with data:", lecturers);

                if (!lecturers || lecturers.length === 0) {
                    tbody.innerHTML = `
                        <tr>
                            <td colspan="10" class="empty-state">
                                <div>
                                    <i>👨‍🏫</i>
                                    <h4>No Lecturer Data</h4>
                                    <p>There are no lecturers in the system yet.</p>
                                    <p>Add new lecturers using the "Add New Lecturer" button.</p>
                                </div>
                            </td>
                        </tr>
                    `;
                    return;
                }

                var html = '';
                lecturers.forEach(function (lecturer) {
                    if (!lecturer || !lecturer.employeeId) {
                        console.log("Skipping invalid lecturer:", lecturer);
                        return; // Skip invalid lecturer objects
                    }

                    // Format programmes as a comma-separated list
                    var programmesText = Array.isArray(lecturer.programmes) ?
                        lecturer.programmes.join(', ') : lecturer.programmes || 'Not assigned';

                    // Truncate if too long
                    if (programmesText.length > 30) {
                        programmesText = programmesText.substring(0, 30) + '...';
                    }

                    html += `
                        <tr>
                            <td>${lecturer.employeeId}</td>
                            <td>${lecturer.firstName || 'N/A'}</td>
                            <td>${lecturer.surname || 'N/A'}</td>
                            <td>${lecturer.email || 'N/A'}</td>
                            <td>${lecturer.phone || 'N/A'}</td>
                            <td>${lecturer.department || 'N/A'}</td>
                            <td title="${Array.isArray(lecturer.programmes) ? lecturer.programmes.join(', ') : lecturer.programmes || ''}">
                                ${programmesText}
                            </td>
                            <td>${lecturer.employmentType || 'N/A'}</td>
                            <td>${lecturer.dateJoined || 'N/A'}</td>
                            <td class="action-cell">
                                <div class="action-buttons-container">
                                    <button class="btn-hr btn-edit" onclick="editLecturer('${lecturer.employeeId}')">✏️ Edit</button>
                                </div>
                            </td>
                        </tr>
                    `;
                });

                tbody.innerHTML = html;
                console.log("Lecturers table updated successfully");
            } catch (error) {
                console.error('Error updating lecturers table:', error);
            }
        }

        // Filter lecturers based on search
        function filterLecturers() {
            try {
                var searchTerm = document.getElementById('searchLecturers').value.toLowerCase();
                var tbody = document.getElementById('lecturersBody');
                var rows = tbody.getElementsByTagName('tr');

                for (var i = 0; i < rows.length; i++) {
                    var row = rows[i];
                    var cells = row.getElementsByTagName('td');
                    if (cells.length < 2) continue; // Skip the empty state row

                    var employeeId = cells[0].textContent.toLowerCase();
                    var firstName = cells[1].textContent.toLowerCase();
                    var surname = cells[2].textContent.toLowerCase();
                    var programmes = cells[6].textContent.toLowerCase();

                    var showRow = true;

                    // Apply search filter
                    if (searchTerm && !employeeId.includes(searchTerm) && !firstName.includes(searchTerm) &&
                        !surname.includes(searchTerm) && !programmes.includes(searchTerm)) {
                        showRow = false;
                    }

                    row.style.display = showRow ? '' : 'none';
                }
            } catch (error) {
                console.error('Error filtering lecturers:', error);
            }
        }

        // Show alert message
        function showAlert(message, type) {
            try {
                var alertDiv = document.getElementById('alertMessage');
                alertDiv.innerHTML = message;
                alertDiv.className = 'alert-message alert-' + type;
                alertDiv.style.display = 'block';
                setTimeout(function () {
                    alertDiv.style.display = 'none';
                }, 12000); // 12 seconds
            } catch (error) {
                console.error('Error showing alert:', error);
            }
        }

        // Edit lecturer - COMPLETELY FIXED
        function editLecturer(employeeId) {
            try {
                console.log("=== EDIT LECTURER STARTED ===");
                console.log("Looking for lecturer with ID:", employeeId);
                console.log("Available lecturers:", lecturers);

                // Validate that we have proper lecturer data
                if (!lecturers || !Array.isArray(lecturers) || lecturers.length === 0) {
                    console.error("No lecturers data available");
                    showAlert('No lecturer data found. Please refresh the page.', 'error');
                    return;
                }

                // Find the lecturer - FIXED: Proper search
                var lecturer = null;
                for (var i = 0; i < lecturers.length; i++) {
                    if (lecturers[i] && lecturers[i].employeeId === employeeId) {
                        lecturer = lecturers[i];
                        break;
                    }
                }

                if (!lecturer) {
                    console.error("Lecturer not found with ID:", employeeId);
                    showAlert('Lecturer not found. Employee ID: ' + employeeId, 'error');
                    return;
                }

                console.log("Found lecturer:", lecturer);

                // Populate the modal form - FIXED: Proper data binding
                document.getElementById('lecturerModalTitle').textContent = 'Edit Lecturer';
                document.getElementById('editLecturerId').value = lecturer.employeeId || '';
                document.getElementById('editFirstName').value = lecturer.firstName || '';
                document.getElementById('editSurname').value = lecturer.surname || '';
                document.getElementById('editEmployeeId').value = lecturer.employeeId || '';
                document.getElementById('editEmail').value = lecturer.email || '';
                document.getElementById('editPhone').value = lecturer.phone || '';
                document.getElementById('editDepartment').value = lecturer.department || '';

                // Set selected programmes - FIXED: Proper programme selection
                var programmeSelect = document.getElementById('editProgrammes');
                console.log("Available programme options:", programmeSelect.options.length);

                // First, clear all selections
                for (var i = 0; i < programmeSelect.options.length; i++) {
                    programmeSelect.options[i].selected = false;
                }

                // Then select the lecturer's programmes
                if (lecturer.programmes) {
                    var programmes = Array.isArray(lecturer.programmes) ? lecturer.programmes : [lecturer.programmes];
                    console.log("Programmes to select:", programmes);

                    for (var i = 0; i < programmeSelect.options.length; i++) {
                        var option = programmeSelect.options[i];
                        if (programmes.includes(option.value)) {
                            option.selected = true;
                            console.log("Selected programme:", option.value);
                        }
                    }
                }

                document.getElementById('editEmploymentType').value = lecturer.employmentType || 'Full-time';
                document.getElementById('editDateJoined').value = lecturer.dateJoined || '';
                document.getElementById('deleteLecturerBtn').style.display = 'inline-block';

                // Show the modal
                document.getElementById('lecturerEditModal').style.display = 'flex';
                currentEditingId = employeeId;

                console.log("Edit modal populated and displayed successfully");
                console.log("=== EDIT LECTURER COMPLETED ===");

            } catch (error) {
                console.error('Error in editLecturer function:', error);
                showAlert('Error loading lecturer data. Please try again.', 'error');
            }
        }

        // Close lecturer edit modal
        function closeLecturerEditModal() {
            document.getElementById('lecturerEditModal').style.display = 'none';
            currentEditingId = null;
        }

        // Save lecturer - FIXED
        function saveLecturer() {
            try {
                console.log("=== SAVE LECTURER STARTED ===");

                var firstName = document.getElementById('editFirstName').value.trim();
                var surname = document.getElementById('editSurname').value.trim();
                var employeeId = document.getElementById('editEmployeeId').value.trim();
                var email = document.getElementById('editEmail').value.trim();

                if (!firstName || !surname || !employeeId || !email) {
                    showAlert('Please fill in all required fields (First Name, Surname, Employee ID, Email).', 'error');
                    return;
                }

                // Validate email format
                var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(email)) {
                    showAlert('Please enter a valid email address.', 'error');
                    return;
                }

                // Get selected programmes
                var programmeSelect = document.getElementById('editProgrammes');
                var selectedProgrammes = [];
                for (var i = 0; i < programmeSelect.options.length; i++) {
                    if (programmeSelect.options[i].selected) {
                        selectedProgrammes.push(programmeSelect.options[i].value);
                    }
                }

                var lecturerData = {
                    employeeId: employeeId,
                    firstName: firstName,
                    surname: surname,
                    email: email,
                    phone: document.getElementById('editPhone').value.trim(),
                    department: document.getElementById('editDepartment').value.trim(),
                    programmes: selectedProgrammes,
                    employmentType: document.getElementById('editEmploymentType').value,
                    dateJoined: document.getElementById('editDateJoined').value
                };

                console.log("Saving lecturer data:", lecturerData);

                if (currentEditingId) {
                    // Update existing lecturer
                    var updated = false;
                    lecturers = lecturers.map(l => {
                        if (l.employeeId === currentEditingId) {
                            updated = true;
                            return lecturerData;
                        }
                        return l;
                    });

                    if (!updated) {
                        // If not found in update, add as new
                        lecturers.push(lecturerData);
                    }

                    console.log("Updated lecturer:", lecturerData);
                } else {
                    // Check if employee ID already exists
                    var existingLecturer = lecturers.find(l => l.employeeId === employeeId);
                    if (existingLecturer) {
                        showAlert('A lecturer with this Employee ID already exists.', 'error');
                        return;
                    }
                    // Add new lecturer
                    lecturers.push(lecturerData);
                    console.log("Added new lecturer:", lecturerData);
                }

                // Save to localStorage
                localStorage.setItem('hrLecturers', JSON.stringify(lecturers));
                console.log("Saved to localStorage:", lecturers);

                // Update UI
                updateLecturersTable();
                updateDashboardStats();
                closeLecturerEditModal();

                showAlert(`Lecturer ${currentEditingId ? 'updated' : 'added'} successfully!`, 'success');
                console.log("=== SAVE LECTURER COMPLETED ===");

            } catch (error) {
                console.error('Error saving lecturer:', error);
                showAlert('Error saving lecturer data. Please try again.', 'error');
            }
        }

        // Show add lecturer modal
        function showAddLecturerModal() {
            console.log("Showing add lecturer modal");

            document.getElementById('lecturerModalTitle').textContent = 'Add New Lecturer';
            document.getElementById('editLecturerId').value = '';
            document.getElementById('editFirstName').value = '';
            document.getElementById('editSurname').value = '';
            document.getElementById('editEmployeeId').value = '';
            document.getElementById('editEmail').value = '';
            document.getElementById('editPhone').value = '';
            document.getElementById('editDepartment').value = '';

            // Clear selected programmes
            var programmeSelect = document.getElementById('editProgrammes');
            for (var i = 0; i < programmeSelect.options.length; i++) {
                programmeSelect.options[i].selected = false;
            }

            document.getElementById('editEmploymentType').value = 'Full-time';
            document.getElementById('editDateJoined').value = new Date().toISOString().split('T')[0];
            document.getElementById('deleteLecturerBtn').style.display = 'none';

            document.getElementById('lecturerEditModal').style.display = 'flex';
            currentEditingId = null;

            console.log("Add lecturer modal shown");
        }

        // Delete lecturer
        function deleteLecturer() {
            if (!currentEditingId) return;

            var confirmDelete = confirm('Are you sure you want to delete this lecturer? This action cannot be undone.');
            if (!confirmDelete) return;

            try {
                lecturers = lecturers.filter(l => l.employeeId !== currentEditingId);
                localStorage.setItem('hrLecturers', JSON.stringify(lecturers));
                updateLecturersTable();
                updateDashboardStats();
                closeLecturerEditModal();
                showAlert('Lecturer deleted successfully!', 'success');
            } catch (error) {
                console.error('Error deleting lecturer:', error);
                showAlert('Error deleting lecturer. Please try again.', 'error');
            }
        }

        // Mark claim as paid
        function markAsPaid(claimId) {
            try {
                // Update HR claims
                hrClaims = hrClaims.map(claim => {
                    if (claim.claimId === claimId) {
                        claim.paymentStatus = 'Paid';
                        claim.paymentDate = new Date().toLocaleDateString('en-GB');
                    }
                    return claim;
                });
                localStorage.setItem('managerClaims', JSON.stringify(hrClaims));

                updateHRClaimsTable();
                updateDashboardStats();
                showAlert('Claim ' + claimId + ' has been marked as paid successfully!', 'success');
            } catch (error) {
                console.error('Error marking claim as paid:', error);
                showAlert('Error marking claim as paid. Please try again.', 'error');
            }
        }

        // Process batch payments
        function processBatchPayments() {
            try {
                var pendingClaims = hrClaims.filter(claim =>
                    claim.managerFinalStatus === 'Approved' && (!claim.paymentStatus || claim.paymentStatus === 'Pending')
                );

                if (pendingClaims.length === 0) {
                    showAlert('No pending claims to process for payment.', 'error');
                    return;
                }

                var confirmProcess = confirm(`You are about to process ${pendingClaims.length} claims for payment. This action cannot be undone. Continue?`);
                if (!confirmProcess) return;

                // Mark all pending claims as paid
                hrClaims = hrClaims.map(claim => {
                    if (claim.managerFinalStatus === 'Approved' && (!claim.paymentStatus || claim.paymentStatus === 'Pending')) {
                        claim.paymentStatus = 'Paid';
                        claim.paymentDate = new Date().toLocaleDateString('en-GB');
                        claim.batchProcessed = true;
                    }
                    return claim;
                });
                localStorage.setItem('managerClaims', JSON.stringify(hrClaims));

                updateHRClaimsTable();
                updateDashboardStats();
                showAlert(`Successfully processed ${pendingClaims.length} claims for payment!`, 'success');
            } catch (error) {
                console.error('Error processing batch payments:', error);
                showAlert('Error processing batch payments. Please try again.', 'error');
            }
        }

        // Generate payment report
        function generatePaymentReport() {
            document.getElementById('paymentReportModal').style.display = 'flex';
            // Set default dates (current month)
            var today = new Date();
            var firstDay = new Date(today.getFullYear(), today.getMonth(), 1);
            var lastDay = new Date(today.getFullYear(), today.getMonth() + 1, 0);

            document.getElementById('reportStartDate').value = firstDay.toISOString().split('T')[0];
            document.getElementById('reportEndDate').value = lastDay.toISOString().split('T')[0];
            document.getElementById('downloadReportBtn').style.display = 'none';
            document.getElementById('reportPreview').style.display = 'none';
        }

        // Close payment report modal
        function closePaymentReportModal() {
            document.getElementById('paymentReportModal').style.display = 'none';
        }

        // Check for updates every 2 seconds
        function checkForUpdates() {
            try {
                var storedClaims = localStorage.getItem('managerClaims');
                if (storedClaims && JSON.parse(storedClaims).length !== hrClaims.length) {
                    hrClaims = JSON.parse(storedClaims);
                    updateHRClaimsTable();
                    updateDashboardStats();
                }

                var storedLecturers = localStorage.getItem('hrLecturers');
                if (storedLecturers) {
                    var parsedLecturers = JSON.parse(storedLecturers);
                    if (parsedLecturers.length !== lecturers.length) {
                        lecturers = parsedLecturers;
                        updateLecturersTable();
                        updateDashboardStats();
                    }
                }
            } catch (error) {
                console.error('Error checking for updates:', error);
            }
        }

        // Initialize on page load
        window.onload = function () {
            console.log("Page loaded, initializing HR Manager...");
            initializeHRDashboard();
            setInterval(checkForUpdates, 2000);
        }

        // Other functions (generatePaymentReportHTML, generateInvoiceReportHTML, generateClaimsAnalysisHTML, downloadReport, exportHRData)
        // ... [Keep all the other existing functions as they are] ...
        function generatePaymentReportHTML(claims, startDate, endDate) {
            var paidClaims = claims.filter(claim => claim.paymentStatus === 'Paid');
            var pendingClaims = claims.filter(claim => claim.managerFinalStatus === 'Approved' && (!claim.paymentStatus || claim.paymentStatus === 'Pending'));
            var totalPaid = paidClaims.reduce((sum, claim) => sum + parseFloat(claim.totalAmount || 0), 0);
            var totalPending = pendingClaims.reduce((sum, claim) => sum + parseFloat(claim.totalAmount || 0), 0);

            var html = `
                <div class="invoice-header">
                    <h3>Payment Report</h3>
                    <p>Period: ${formatDate(startDate)} to ${formatDate(endDate)}</p>
                </div>
                <div class="invoice-details">
                    <div>
                        <strong>Report Summary:</strong><br>
                        Total Claims: ${claims.length}<br>
                        Paid Claims: ${paidClaims.length}<br>
                        Pending Payments: ${pendingClaims.length}<br>
                    </div>
                    <div>
                        <strong>Financial Summary:</strong><br>
                        Total Paid: R ${totalPaid.toFixed(2)}<br>
                        Total Pending: R ${totalPending.toFixed(2)}<br>
                        Grand Total: R ${(totalPaid + totalPending).toFixed(2)}<br>
                    </div>
                </div>
                <table class="invoice-table">
                    <thead>
                        <tr>
                            <th>Claim ID</th>
                            <th>Lecturer</th>
                            <th>Module</th>
                            <th>Programme</th>
                            <th>Date</th>
                            <th>Amount</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
            `;

            claims.forEach(claim => {
                var status = claim.paymentStatus === 'Paid' ? 'Paid' : 'Pending Payment';
                html += `
                    <tr>
                        <td>${claim.claimId || 'N/A'}</td>
                        <td>${claim.fullName || 'N/A'} ${claim.surname || 'N/A'}</td>
                        <td>${claim.moduleCode || 'N/A'}</td>
                        <td>${claim.programme || 'N/A'}</td>
                        <td>${claim.date || 'N/A'}</td>
                        <td>R ${claim.totalAmount || '0'}</td>
                        <td>${status}</td>
                    </tr>
                `;
            });

            html += `
                    </tbody>
                </table>
                <div class="invoice-total">
                    Generated on: ${new Date().toLocaleDateString('en-GB')}
                </div>
            `;

            return html;
        }

        function generateInvoiceReportHTML(claims, startDate, endDate) {
            var paidClaims = claims.filter(claim => claim.paymentStatus === 'Paid');
            var totalAmount = paidClaims.reduce((sum, claim) => sum + parseFloat(claim.totalAmount || 0), 0);

            var html = `
                <div class="invoice-header">
                    <h3>Invoice Summary</h3>
                    <p>Period: ${formatDate(startDate)} to ${formatDate(endDate)}</p>
                </div>
                <div class="invoice-details">
                    <div>
                        <strong>Invoice To:</strong><br>
                        University of Namibia<br>
                        Finance Department<br>
                        Private Bag 13301<br>
                        Windhoek, Namibia
                    </div>
                    <div>
                        <strong>Invoice Details:</strong><br>
                        Invoice Date: ${new Date().toLocaleDateString('en-GB')}<br>
                        Period: ${formatDate(startDate)} to ${formatDate(endDate)}<br>
                        Total Invoices: ${paidClaims.length}<br>
                    </div>
                </div>
                <table class="invoice-table">
                    <thead>
                        <tr>
                            <th>Invoice #</th>
                            <th>Lecturer</th>
                            <th>Employee ID</th>
                            <th>Description</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <tbody>
            `;

            paidClaims.forEach((claim, index) => {
                html += `
                    <tr>
                        <td>INV-${claim.claimId || 'N/A'}</td>
                        <td>${claim.fullName || 'N/A'} ${claim.surname || 'N/A'}</td>
                        <td>${claim.employeeID || 'N/A'}</td>
                        <td>Payment for ${claim.moduleCode || 'N/A'} - ${claim.programme || 'N/A'}</td>
                        <td>R ${claim.totalAmount || '0'}</td>
                    </tr>
                `;
            });

            html += `
                    </tbody>
                </table>
                <div class="invoice-total">
                    Total Amount: R ${totalAmount.toFixed(2)}
                </div>
            `;

            return html;
        }

        function generateClaimsAnalysisHTML(claims, startDate, endDate) {
            // Group claims by programme
            var programmeStats = {};
            claims.forEach(claim => {
                var programme = claim.programme || 'Unknown';
                if (!programmeStats[programme]) {
                    programmeStats[programme] = {
                        count: 0,
                        totalAmount: 0,
                        paidAmount: 0,
                        pendingAmount: 0
                    };
                }
                programmeStats[programme].count++;
                programmeStats[programme].totalAmount += parseFloat(claim.totalAmount || 0);

                if (claim.paymentStatus === 'Paid') {
                    programmeStats[programme].paidAmount += parseFloat(claim.totalAmount || 0);
                } else {
                    programmeStats[programme].pendingAmount += parseFloat(claim.totalAmount || 0);
                }
            });

            var html = `
                <div class="invoice-header">
                    <h3>Claims Analysis Report</h3>
                    <p>Period: ${formatDate(startDate)} to ${formatDate(endDate)}</p>
                </div>
                <div class="invoice-details">
                    <div>
                        <strong>Overall Statistics:</strong><br>
                        Total Claims: ${claims.length}<br>
                        Total Amount: R ${claims.reduce((sum, claim) => sum + parseFloat(claim.totalAmount || 0), 0).toFixed(2)}<br>
                        Average Claim: R ${(claims.reduce((sum, claim) => sum + parseFloat(claim.totalAmount || 0), 0) / claims.length).toFixed(2)}<br>
                    </div>
                    <div>
                        <strong>Status Breakdown:</strong><br>
                        Paid Claims: ${claims.filter(c => c.paymentStatus === 'Paid').length}<br>
                        Pending Payment: ${claims.filter(c => c.managerFinalStatus === 'Approved' && (!c.paymentStatus || c.paymentStatus === 'Pending')).length}<br>
                    </div>
                </div>
                <table class="invoice-table">
                    <thead>
                        <tr>
                            <th>Programme</th>
                            <th>Claims Count</th>
                            <th>Total Amount</th>
                            <th>Paid Amount</th>
                            <th>Pending Amount</th>
                        </tr>
                    </thead>
                    <tbody>
            `;

            for (var programme in programmeStats) {
                var stats = programmeStats[programme];
                html += `
                    <tr>
                        <td>${programme}</td>
                        <td>${stats.count}</td>
                        <td>R ${stats.totalAmount.toFixed(2)}</td>
                        <td>R ${stats.paidAmount.toFixed(2)}</td>
                        <td>R ${stats.pendingAmount.toFixed(2)}</td>
                    </tr>
                `;
            }

            html += `
                    </tbody>
                </table>
            `;

            return html;
        }

        function downloadReport() {
            try {
                var reportContent = document.getElementById('reportPreview').innerHTML;
                var reportType = document.getElementById('reportType').value;
                var startDate = document.getElementById('reportStartDate').value;
                var endDate = document.getElementById('reportEndDate').value;

                // Create a Blob with the report content
                var blob = new Blob([`
                    <!DOCTYPE html>
                    <html>
                    <head>
                        <title>${reportType.charAt(0).toUpperCase() + reportType.slice(1)} Report</title>
                        <style>
                            body { font-family: Arial, sans-serif; margin: 20px; }
                            table { width: 100%; border-collapse: collapse; margin: 20px 0; }
                            th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
                            th { background-color: #f2f2f2; }
                            .invoice-header { text-align: center; margin-bottom: 20px; }
                            .invoice-details { display: flex; justify-content: space-between; margin-bottom: 20px; }
                            .invoice-total { text-align: right; font-weight: bold; margin-top: 20px; }
                        </style>
                    </head>
                    <body>
                        ${reportContent}
                    </body>
                    </html>
                `], { type: 'text/html' });

                // Create download link
                var link = document.createElement('a');
                link.href = URL.createObjectURL(blob);
                link.download = `${reportType}_report_${startDate}_to_${endDate}.html`;
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);

                showAlert('Report downloaded successfully!', 'success');
            } catch (error) {
                console.error('Error downloading report:', error);
                showAlert('Error downloading report. Please try again.', 'error');
            }
        }

        function exportHRData() {
            try {
                // Create CSV content for claims
                var claimsCsv = "Claim ID,Name,Surname,Employee ID,Module Code,Programme,Date,Hours,Hourly Rate,Total Amount,Manager Status,Payment Status\n";
                hrClaims.forEach(function (claim) {
                    claimsCsv += `"${claim.claimId || ''}","${claim.fullName || ''}","${claim.surname || ''}","${claim.employeeID || ''}","${claim.moduleCode || ''}","${claim.programme || ''}","${claim.date || ''}","${claim.hours || ''}","R${claim.hourlyRate || ''}","R${claim.totalAmount || ''}","${claim.managerFinalStatus || ''}","${claim.paymentStatus || 'Pending'}"\n`;
                });

                // Create CSV content for lecturers
                var lecturersCsv = "Employee ID,First Name,Surname,Email,Phone,Department,Programmes,Employment Type,Date Joined\n";
                lecturers.forEach(function (lecturer) {
                    var programmes = Array.isArray(lecturer.programmes) ? lecturer.programmes.join('; ') : lecturer.programmes || '';
                    lecturersCsv += `"${lecturer.employeeId || ''}","${lecturer.firstName || ''}","${lecturer.surname || ''}","${lecturer.email || ''}","${lecturer.phone || ''}","${lecturer.department || ''}","${programmes}","${lecturer.employmentType || ''}","${lecturer.dateJoined || ''}"\n`;
                });

                // Create zip file with both CSVs
                var zip = new JSZip();
                zip.file("hr_claims_export.csv", claimsCsv);
                zip.file("hr_lecturers_export.csv", lecturersCsv);

                zip.generateAsync({ type: "blob" }).then(function (content) {
                    var link = document.createElement("a");
                    link.href = URL.createObjectURL(content);
                    link.download = "hr_data_export_" + new Date().toISOString().split('T')[0] + ".zip";
                    link.style.visibility = 'hidden';
                    document.body.appendChild(link);
                    link.click();
                    document.body.removeChild(link);
                });

                showAlert('HR data exported successfully!', 'success');
            } catch (error) {
                console.error('Error exporting HR data:', error);
                showAlert('Error exporting HR data. Please try again.', 'error');
            }
        }

        function previewReport() {
            try {
                var startDate = document.getElementById('reportStartDate').value;
                var endDate = document.getElementById('reportEndDate').value;
                var reportType = document.getElementById('reportType').value;

                if (!startDate || !endDate) {
                    showAlert('Please select both start and end dates.', 'error');
                    return;
                }

                var start = new Date(startDate);
                var end = new Date(endDate);

                if (start > end) {
                    showAlert('Start date cannot be after end date.', 'error');
                    return;
                }

                // Filter claims by date
                var filteredClaims = hrClaims.filter(claim => {
                    var claimDate = parseDate(claim.date);
                    return claimDate >= start && claimDate <= end;
                });

                if (filteredClaims.length === 0) {
                    showAlert('No claims found for the selected period.', 'error');
                    return;
                }

                // Generate report preview based on type
                var reportHtml = '';
                if (reportType === 'payment') {
                    reportHtml = generatePaymentReportHTML(filteredClaims, startDate, endDate);
                } else if (reportType === 'invoice') {
                    reportHtml = generateInvoiceReportHTML(filteredClaims, startDate, endDate);
                } else if (reportType === 'claims') {
                    reportHtml = generateClaimsAnalysisHTML(filteredClaims, startDate, endDate);
                }

                document.getElementById('reportPreview').innerHTML = reportHtml;
                document.getElementById('reportPreview').style.display = 'block';
                document.getElementById('downloadReportBtn').style.display = 'inline-block';
            } catch (error) {
                console.error('Error generating report preview:', error);
                showAlert('Error generating report. Please try again.', 'error');
            }
        }

        // Utility function to parse date from string (DD/MM/YYYY format)
        function parseDate(dateString) {
            if (!dateString) return new Date();
            // Handle both DD/MM/YYYY and YYYY-MM-DD formats
            if (dateString.includes('/')) {
                var parts = dateString.split('/');
                return new Date(parts[2], parts[1] - 1, parts[0]);
            } else {
                return new Date(dateString);
            }
        }

        // Utility function to format date as DD/MM/YYYY
        function formatDate(dateString) {
            if (!dateString) return '';
            var date = new Date(dateString);
            var day = date.getDate().toString().padStart(2, '0');
            var month = (date.getMonth() + 1).toString().padStart(2, '0');
            var year = date.getFullYear();
            return `${day}/${month}/${year}`;
        }
    </script>
    <!-- Include JSZip for export functionality -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
</asp:Content>