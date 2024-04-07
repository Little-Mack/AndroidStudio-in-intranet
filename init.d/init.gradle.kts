// Изменяем настройки settings.gradle
    fun RepositoryHandler.RepoPluginConfig() {
        gradle.settingsEvaluated {
            // Добавляем репозиторий для плагинов
            pluginManagement {
                repositories {
                    add(maven {
                        url = uri("http://My_IP_or_Domain_Name:8081/repository/maven-public/")
                        // Разрешаем использование http
                        setAllowInsecureProtocol(true)
                    })
                }
            }
            dependencyResolutionManagement {
                // Режим использования репозитория объявленного в проекте, при этом игнорируя репозитории в settings.gradle
                repositoriesMode.set(RepositoriesMode.PREFER_PROJECT)   
            }
        }
    }
// Добавляем репозиторий для проекта
fun RepositoryHandler.RepoConfig()
{
    add(maven {
            url = uri("http://My_IP_or_Domain_Name:8081/repository/maven-public/")
            setAllowInsecureProtocol(true)
        })
}

gradle.beforeSettings { 
    pluginManagement.repositories.RepoPluginConfig()
}

gradle.allprojects {
    buildscript.repositories.RepoConfig()
    repositories.RepoConfig()
}