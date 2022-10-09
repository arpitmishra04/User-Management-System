package mongodb.model;

public class User {
private String id;
private String Name;
private String Email;
private String Password;

public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getName() {
	return Name;
}
public void setName(String name) {
	Name = name;
}
public String getEmail() {
	return Email;
}
public void setEmail(String email) {
	Email = email;
}
public String getPassword() {
	return Password;
}
public void setPassword(String password) {
	Password = password;
}
}
