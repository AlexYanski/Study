

struct Github {
    let name: String?
    let author: String?
    let URL: String?
}

var alexGithub = Github(name: "Alexandr Yanski the Developer", author: "Alexandr Yanski", URL: "https://github.com")


// Unwrap

func getGithubInfo(git: Github) {
    if let githubName = git.name, let githubAuthor = git.author, let githubURL = git.URL {
        print("Github Name: \(githubName)")
        print("Github Author: \(githubAuthor)")
        print("Github URL: \(githubURL)")
    } else {
        print("Error")
    }
}

getGithubInfo(git: alexGithub)


// Better way --> guard statement
// Early exit, if there is "nil"

func getGitInfoWithGuard(git: Github) {
    
    guard let githubName = git.name, let githubAuthor = git.author, let githubURL = git.URL  else {
        print("Error")
        return
    }
    print("Github Name: \(githubName)")
    print("Github Author: \(githubAuthor)")
    print("Github URL: \(githubURL)")
}

getGitInfoWithGuard(git: alexGithub)