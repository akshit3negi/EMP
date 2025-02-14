<%@page import="bean.Subject"%>
<%@page import="bean.Student"%>
<%@page import="java.util.List"%>
<%@page import="dao.SubjectOperations"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%-- <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/common/style.css"> --%>

<style>

* {
    font-family: monospace;
    font-size: 15px;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}



.header-background {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
     background: url('<%= request.getContextPath() %>/common/bg.gif') no-repeat center center fixed;
    background-size: cover;
    opacity: 0.9;
    z-index: -1;
}

.header-container {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 10px 20px; 
    background: rgba(44, 44, 44, 0.9);
    color: #f0f0f0;
    width: 100%;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1000;
    height: 60px; /* Fixed height to prevent inconsistent size */
}

.logo-container {
    flex: 1;
}

.logo {
    height: 40px; /* Reduced height to match header */
    width: auto;
}

.navbar {
    flex: 3;
    display: flex;
    justify-content: flex-end;
    align-items: center;
}

.nav-menu {
    list-style: none;
    display: flex;
    gap: 20px;
}

.nav-menu li {
    position: relative;
}

.nav-menu a {
    text-decoration: none;
    color: #f0f0f0;
    font-weight: bold;
    padding: 8px 12px;
}

/* Ensure dropdown styles are always applied correctly */
.header-container .dropdown-menu {
    display: none;
    position: absolute;
    background: rgba(51, 51, 51, 0.9) !important;
    list-style: none;
    padding: 5px;
    border-radius: 5px;
    min-width: 100px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

.header-container .dropdown-menu li {
    padding: 5	px;
}

.header-container .dropdown-menu a {
    color: #f0f0f0;
    text-decoration: none;
    display: block;
    padding: 8px 12px;
}

.header-container .dropdown:hover .dropdown-menu {
    display: block;
}

.user-dropdown {
    cursor: pointer;
}

.navbar-toggle {
    display: none;
    background: transparent;
    border: none;
    cursor: pointer;
}

.bar {
    display: block;
    width: 25px;
    height: 3px;
    margin: 5px auto;
    background: #f0f0f0;
}

</style>


<div class="header-background"></div>
<header class="header-container">
    <div class="logo-container">
        <a href="../EMP/index.jsp"><img class="logo" src="<%= request.getContextPath() %>/common/logo.png" alt="Logo"></a>
    </div>
    <nav class="navbar">
        <button class="navbar-toggle">
            <span class="bar"></span>
            <span class="bar"></span>
            <span class="bar"></span>
        </button>
        <ul class="nav-menu">
            <li><a href="../EMP/index.jsp">Home</a></li>
            <li class="dropdown">
                <a href="#">Exams <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                <ul class="dropdown-menu">
                    <% SubjectOperations sd = new SubjectOperations();
                    List<Subject> lisub = sd.selectAllSubject();
                    for (Subject sub : lisub) { %>
                    <li><a href="Exam/ExamPhase2.jsp?subject=<%= sub.getSub_id() %>"><%= sub.getSub_name() %></a></li>
                    <% } %>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#">Register As <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                <ul class="dropdown-menu">
                    <li><a href="<%= request.getContextPath() %>/StudentRegistrationForm.jsp">Student</a></li>
                </ul>
            </li>
            <li><a href="#">Contact Us</a></li>
            <li class="dropdown user-dropdown">
                <% if (session.getAttribute("LogedIn") == null) { %>
                <a href="UserLogin.jsp?pagename=<%= request.getRequestURI() %>">
                    <i class="fa fa-sign-in" aria-hidden="true"></i> Login
                </a>
                <% } else {
                    Student st = (Student) session.getAttribute("LogedIn"); %>
                <a href="#">
                    <%= st.getName() %> <i class="fa fa-angle-down" aria-hidden="true"></i>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="UserProfile.jsp"><%=st.getUsername()%>'s Profile</a></li>
                    <li><a href="Logout"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
                </ul>
                <% } %>
            </li>
        </ul>
    </nav>
</header>
