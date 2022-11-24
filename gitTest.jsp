This is git test
After colab
test1

<indirectSurvey class="js"></indirectSurvey>
<%
                if(status.equals("Completed"))
                {
                %>
                <a onclick="return confirm('Are you sure want to re-enable the survey')" href="enableSurvey.jsp?id=<%=rs.getInt("id")%>">Re-Enable</a>
                <% 
                } 
                %>