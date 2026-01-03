# 📋 TodoList Application

Une application web moderne de gestion de tâches développée avec **Jakarta EE** et **MySQL**.

## ✨ Caractéristiques

- ➕ Créer, modifier et supprimer des tâches
- ✅ Marquer les tâches comme complétées
- 📝 Gestion des descriptions détaillées
- 🎯 Interface utilisateur intuitive
- 🗄️ Stockage persistant avec MySQL

## 🛠️ Stack Technique

| Technologie | Version |
|------------|---------|
| Java | 17 |
| Jakarta EE | 6.0 |
| MySQL | 8.0+ |
| Maven | 3.6+ |
| Apache Tomcat | 10 |

## 🚀 Démarrage Rapide

### Prérequis

- JDK 17
- MySQL 8.0+
- Maven 3.6+
- Apache Tomcat 10

### Installation

1. **Cloner le projet**
   ```bash
   git clone https://github.com/ABDELFATTAHBEZZAZ/tp_todoList.git
   cd tp_todoList
   ```

2. **Créer la base de données**
   ```sql
   CREATE DATABASE todolist_db;
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

3. **Configurer la connexion**
   
   Modifiez `DatabaseConnection.java` avec vos identifiants MySQL :
   ```java
   private static final String USER = "votre_utilisateur";
   private static final String PASSWORD = "votre_mot_de_passe";
   ```

4. **Compiler et déployer**
   ```bash
   mvn clean package
   cp target/todolist-app-1.0-SNAPSHOT.war $CATALINA_HOME/webapps/
   ```

5. **Accéder à l'application**
   
   Ouvrez votre navigateur : `http://localhost:8080/todolist-app-1.0-SNAPSHOT/`

## 📂 Architecture

```
src/main/
├── java/com/example/todolistapp/
│   ├── controller/    # Servlets (contrôleurs)
│   ├── dao/           # Accès aux données
│   └── model/         # Modèles de données
└── webapp/
    ├── index.jsp      # Page d'accueil
    └── WEB-INF/
        └── views/     # Vues JSP
```

**Pattern MVC** : Model-View-Controller avec DAO pour la persistance.

## 📖 Utilisation

1. Accédez à l'application via votre navigateur
2. Cliquez sur "Ajouter une tâche" pour créer une nouvelle tâche
3. Utilisez les boutons "Modifier" ou "Supprimer" pour gérer vos tâches
4. Changez le statut pour marquer une tâche comme complétée

## 🔧 Configuration

### Variables de connexion

Éditez `src/main/java/com/example/todolistapp/dao/DatabaseConnection.java` :

```java
private static final String URL = "jdbc:mysql://localhost:3306/todolist_db";
private static final String USER = "root";
private static final String PASSWORD = "root";
```

## 🐛 Résolution de problèmes

| Problème | Solution |
|----------|----------|
| Erreur de connexion DB | Vérifiez que MySQL est démarré et que les identifiants sont corrects |
| Erreur 404 | Vérifiez le nom du contexte dans l'URL et le déploiement du WAR |
| Erreur de compilation | Vérifiez que Java 17 et Maven sont installés |

## 👤 Auteur

**ABDELFATTAH BEZZAZ**

🔗 [GitHub Profile](https://github.com/ABDELFATTAHBEZZAZ)

## 📄 Licence

Ce projet est libre d'utilisation.

---

⭐ **N'oubliez pas de mettre une étoile si ce projet vous a aidé !**
