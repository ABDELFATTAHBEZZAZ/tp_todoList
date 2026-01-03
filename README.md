# 📝 TodoList Application

Application web de gestion de tâches (To-Do List) développée avec **Jakarta EE** utilisant une architecture **MVC** propre. Cette application permet aux utilisateurs de créer, modifier, supprimer et marquer des tâches comme terminées.

## 🚀 Fonctionnalités

- ✅ **Création de tâches** : Ajouter de nouvelles tâches avec un titre et une description
- ✏️ **Modification de tâches** : Éditer les tâches existantes
- 🗑️ **Suppression de tâches** : Supprimer les tâches non désirées
- ✔️ **Gestion du statut** : Marquer les tâches comme complétées ou en cours
- 📋 **Liste des tâches** : Afficher toutes les tâches avec leurs détails
- 🎨 **Interface utilisateur** : Interface web moderne et intuitive avec JSP

## 🛠️ Technologies Utilisées

- **Java 17** : Langage de programmation
- **Jakarta EE** : Framework Java Enterprise Edition
- **Jakarta Servlets** : Gestion des requêtes HTTP
- **JSP (JavaServer Pages)** : Génération dynamique des pages web
- **JSTL (Jakarta Standard Tag Library)** : Bibliothèque de balises pour JSP
- **JDBC** : Connexion et interaction avec la base de données
- **MySQL 8** : Base de données relationnelle
- **Maven** : Gestion des dépendances et build du projet
- **Apache Tomcat 10** : Serveur d'applications web

## 📋 Prérequis

Avant de commencer, assurez-vous d'avoir installé :

- **JDK 17** ou supérieur
- **Maven 3.6+**
- **MySQL 8.0+**
- **Apache Tomcat 10** (pour le déploiement)

## 🔧 Installation

### 1. Cloner le dépôt

```bash
git clone https://github.com/ABDELFATTAHBEZZAZ/tp_todoList.git
cd tp_todoList
```

### 2. Configuration de la base de données

1. Créez une base de données MySQL :

```sql
CREATE DATABASE todolist_db;
```

2. Créez la table `todos` :

```sql
USE todolist_db;

CREATE TABLE todos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    description TEXT,
    statut VARCHAR(50) DEFAULT 'en_cours',
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    date_modification TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

3. Configurez les paramètres de connexion dans `DatabaseConnection.java` :

```java
private static final String URL = "jdbc:mysql://localhost:3306/todolist_db?useSSL=false&serverTimezone=UTC";
private static final String USER = "root";  // Votre nom d'utilisateur MySQL
private static final String PASSWORD = "root";  // Votre mot de passe MySQL
```

### 3. Compilation du projet

```bash
mvn clean compile
```

### 4. Construction du WAR

```bash
mvn clean package
```

Le fichier WAR sera généré dans le dossier `target/todolist-app-1.0-SNAPSHOT.war`

## 🚀 Déploiement

### Déploiement sur Apache Tomcat

1. Copiez le fichier WAR dans le répertoire `webapps` de Tomcat :

```bash
cp target/todolist-app-1.0-SNAPSHOT.war $CATALINA_HOME/webapps/
```

2. Démarrez Tomcat :

```bash
$CATALINA_HOME/bin/startup.sh  # Linux/Mac
# ou
$CATALINA_HOME/bin/startup.bat  # Windows
```

3. Accédez à l'application :

```
http://localhost:8080/todolist-app-1.0-SNAPSHOT/
```

## 📁 Structure du Projet

```
todoList-app-main/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/example/todolistapp/
│       │       ├── controller/
│       │       │   └── TodoServlet.java      # Contrôleur principal
│       │       ├── dao/
│       │       │   ├── DatabaseConnection.java  # Gestion de la connexion DB
│       │       │   └── TodoDAO.java            # Accès aux données
│       │       └── model/
│       │           └── Todo.java                # Modèle de données
│       └── webapp/
│           ├── index.jsp                        # Page d'accueil
│           └── WEB-INF/
│               ├── views/
│               │   ├── todoList.jsp            # Liste des tâches
│               │   └── editTodo.jsp            # Formulaire d'édition
│               └── web.xml                     # Configuration web
├── pom.xml                                     # Configuration Maven
├── .gitignore                                  # Fichiers ignorés par Git
└── README.md                                   # Documentation
```

## 🏗️ Architecture

L'application suit une architecture **MVC (Model-View-Controller)** :

- **Model** : Classe `Todo` représentant les données
- **View** : Pages JSP (`todoList.jsp`, `editTodo.jsp`, `index.jsp`)
- **Controller** : `TodoServlet` gérant les requêtes HTTP
- **DAO** : `TodoDAO` pour l'accès aux données (pattern Data Access Object)

## 📝 Utilisation

1. **Accéder à l'application** : Ouvrez votre navigateur et allez sur `http://localhost:8080/todolist-app-1.0-SNAPSHOT/`

2. **Créer une tâche** : Cliquez sur "Ajouter une tâche" et remplissez le formulaire

3. **Modifier une tâche** : Cliquez sur "Modifier" à côté de la tâche souhaitée

4. **Supprimer une tâche** : Cliquez sur "Supprimer" à côté de la tâche souhaitée

5. **Changer le statut** : Utilisez les options disponibles pour marquer une tâche comme complétée

## 🔒 Configuration de Sécurité

⚠️ **Important** : Pour la production, modifiez les identifiants de la base de données dans `DatabaseConnection.java` et utilisez des variables d'environnement ou un fichier de configuration externe.

## 🐛 Dépannage

### Problème de connexion à la base de données

- Vérifiez que MySQL est démarré
- Vérifiez les identifiants dans `DatabaseConnection.java`
- Assurez-vous que la base de données `todolist_db` existe

### Erreur 404

- Vérifiez que le WAR est bien déployé dans Tomcat
- Vérifiez l'URL dans le navigateur (le nom du contexte peut varier)

### Erreur de compilation

- Vérifiez que Java 17 est installé : `java -version`
- Vérifiez que Maven est installé : `mvn -version`

## 👨‍💻 Auteur

**ABDELFATTAH BEZZAZ**

- GitHub: [@ABDELFATTAHBEZZAZ](https://github.com/ABDELFATTAHBEZZAZ)

## 📄 Licence

Ce projet est sous licence libre. Vous êtes libre de l'utiliser, le modifier et le distribuer.

## 🤝 Contribution

Les contributions sont les bienvenues ! N'hésitez pas à ouvrir une issue ou une pull request.

---

⭐ Si ce projet vous a été utile, n'hésitez pas à lui donner une étoile !
