# Signup Presenter

## Regras
1. ✅ Chamar Validation ao alterar o email
2. ✅ Notificar o emailErrorStream com o mesmo erro do Validation, caso retorne erro
3. ✅ Notificar o emailErrorStream com null, caso o Validation não retorne erro
4. ✅ Não notificar o emailErrorStream se o valor for igual ao último
5. ✅ Notificar o isFormValidStream se o valor for igual ao último
6. Chamar Validation ao alterar a senha
7. Notificar o passwordErrorStream com o memso erro do Validation, caso retorne erro
8. Notificar o passwordErrorStream com null, caso o validation não retorne erro
9. Não notificar o passwordErrorStream se o valor for igual ao último
10. Notificar o isFormValidStream após alterar a senha
11. ✅ Chamar Validation ao altear o nome
12. ✅ Notificar o nameErrorStream com o mesmo ero do Validation, caso retorne erro
13. ✅ Notificar o nameErrorStream com null, caso o Validation não retorne erro
14. ✅ Não notificar o nameErrorStream se o valor for igual ao último
15. ✅ Notificar o isFormValidStream após alterar o nome
16. Chamar Validation ao alterar a confirmação de senha
17. Notificar o passwordConfirmationErrorStream com o mesmo erro do Validation, caso retorne erro
18. Notificar o passwordConfirmationErrorStream com null, caso o Validation não retorne erro
19. Não notificar o passwordConfirmationErrorStream se o valor for igual ao último
20. Notificar o isFormValidStream após alterar a confirmação de senha
21. Para o formulário estar válido todos os Streams de ero precisam estar null e todos os campos obrigatórios não podem estar vazios
22. Não notificar o isFormValidStream se o valor for igual ao último
23. Chamar o AddAccount com valores corretos
24. Notificar o isLoadingStream com true antes de chamar o AddAccount
25. Notificar o isLoadingStream com false no fim do AddAccount