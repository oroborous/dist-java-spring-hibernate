Users and Authorities
---------------------
This project's database contains two users:

<table>
<tr>
<th>Username</th><th>Password</th><th>Authorities</th>
</tr>
<tr>
<td>stacy</td><td>p</td><td>USER, ADMIN</td>
</tr>
<tr>
<td>gigi</td><td>p</td><td>USER</td>
</tr>
</table>

### Unauthenticated Users

Users who are not logged in may view the list of donuts and may search for donuts by name.

### USER Authority

Authenticated users with the USER authority may view the list and search by name. They may also create new donuts or update existing donuts.

### ADMIN Authority

Authenticated users with the ADMIN authority may view the list and search by name. They may also delete donuts.