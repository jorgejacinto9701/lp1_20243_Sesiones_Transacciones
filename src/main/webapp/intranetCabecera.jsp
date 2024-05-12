<%@page import="entidad.Enlace"%>
<%@page import="java.util.List"%>
<div class="container">
 <div class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    
    <div class="collapse navbar-collapse">
    <ul class="nav navbar-nav navbar-left">
       	<li><a href="intranetHome.jsp">Home</a></li>
    </ul>
      
    <ul class="nav navbar-nav">
    	<li class="dropdown">
	        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	          Menú<b class="caret"></b>
	        </a>
	        <ul class="dropdown-menu">
	        	<%
	        		List<Enlace> lstMenus = (List<Enlace>)	session.getAttribute("objMenus");
	        	    if (lstMenus!= null){
	        	     for (Enlace obj: lstMenus)	{
	        	%>
	        		<li>
	        			<a href="<%= obj.getRuta() %>">
	        				<%= obj.getDescripcion() %>
	        			</a>
	        		</li>
	        	<% }} %>		
	        </ul>
     	</li>
     </ul>
      
     <ul class="nav navbar-nav navbar-right">
       	<li><a href="logout">Salir</a></li>
     </ul>
      
    </div>
  </div>
</div>  
</div>