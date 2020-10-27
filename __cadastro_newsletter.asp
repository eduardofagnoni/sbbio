<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!-- #include file="admin/_classes/__cl__conexao.asp" -->

<%
	Function SafeSQL(sInput)
		TempString = sInput	  
		sBadChars=array("select", "drop", ";", "--", "insert", "delete", "xp_", "#", "%", "&", "'", "(", ")", ":", ";", "<", ">", "=", "[", "]", "?", "'", "|") 
		For iCounter = 0 to uBound(sBadChars)
			TempString = replace(TempString,sBadChars(iCounter),"")
		Next
		SafeSQL = TempString
	End function
	
	Function SafeSQLHTML(sInput)
		TempString = sInput	  
		sBadChars=array("select", "drop", "--", "insert", "delete", "xp_", "'") 
		For iCounter = 0 to uBound(sBadChars)
			TempString = replace(TempString,sBadChars(iCounter),"")
		Next
		SafeSQLHTML = TempString
	End function

datasys = now()
ipCapturado = Request.ServerVariables("remote_addr")
dominioAcessado = Request.ServerVariables("server_name")
portaUtilizada = Request.ServerVariables("server_port")
metodoParaChamarAPagina = Request.ServerVariables("request_method")
cadastro_dados_iniciais = datasys&" - IP:"&ipCapturado&":"&portaUtilizada&" - Dom. Acesso:"&dominioAcessado&" - Metodo:"&metodoParaChamarAPagina
ultima_alteracao = cadastro_dados_iniciais
varRegIncluido="s" 'regIncluido

Dim oConexaoAdd
Set oConexaoAdd = New Conexao
oConexaoAdd.AbreConexao() 

	nome			= SafeSQL(request.form("txtNome"))
	email			= SafeSQL(request.form("txtEmail"))
	data			= Date()

	' preparando a data para gravacao
	if data<>"" then
		data = replace(data,"/",".")
		data = replace(data,"-",".")
		data = split(data,".")
		dia=data(0)
		mes=data(1)
		ano=data(2)
		data = ano+"-"+mes+"-"+dia
	end if		
	

	oConexaoAdd.AddItem("INSERT INTO "&oConexaoAdd.prefixoTabela&"newsletter (nome, email, data, dia, mes, ano) values ('"&nome&"','"&email&"','"&data&"','"&dia&"','"&mes&"','"&ano&"')")


    'Envia email

    'envia senha e login para o email cadastrado ********************
		'envia email - PADRAO LOCAWEB
		Set objCDOSYSMail = Server.CreateObject("CDO.Message")
		Set objCDOSYSCon = Server.CreateObject ("CDO.Configuration")		 
		
		'sem autenticação'
			objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "localhost"
			objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
			objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
			objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 30
		 
		objCDOSYSCon.Fields.update 
		 
		Set objCDOSYSMail.Configuration = objCDOSYSCon
		objCDOSYSMail.From = "sbbio@sbbio.com.br"
		objCDOSYSMail.To = "eduardo@brancozulu.com.br" 'sbbio@sbbio.com.br 
		objCDOSYSMail.Subject = "Quero fazer o curso"
		
		'montando a mensagem'       

        mailMesg = nome&" - "&email


		objCDOSYSMail.HtmlBody = mailMesg
		
        objCDOSYSMail.Send        	
		 
		set objCDOSYSMail = nothing
		set objCDOSYSCon = nothing
		'***********************************************************

	
%>