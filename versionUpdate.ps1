$commitMessage = "feat(test): This is a feature"
$global:version=""
$global:major=""
$global:minor=""
$global:patch=""
$global:newVersion=""

function getVersion { 
    $content = Get-Content .\package.json -Raw | ConvertFrom-Json
    $global:version = $content.version

    $versionSplitted = $version.Split(".")

    $global:major = $versionSplitted[0]
    $global:minor = $versionSplitted[1]
    $global:patch = $versionSplitted[2]
}

function print {
    Write-Output "Version from json: $version"
    Write-Output "major: $major"
    Write-Output "minor: $minor"
    Write-Output "patch: $patch"
}

function incrementMajor {
    $major=[int]$major+1
    $minor=0
    $patch=0
    $newVersion="$major.$minor.$patch"

    Write-Output "When I incrementMajor, the new version is: $newVersion"
}

function incrementMinor {
    $minor=[int]$minor+1
    $patch=0
    $newVersion="$major.$minor.$patch"

    Write-Output "When I incrementMinor, the new version is: $newVersion"
}

function incrementPatch {
    $patch=[int]$patch + 1
    $newVersion="$major.$minor.$patch"

    Write-Output "When I incrementPatch, the new version is: $newVersion"
}

function incrementVersion {
    if($commitMessage.StartsWith("major(")) {
        incrementMajor
    }
    if($commitMessage.StartsWith("feat(")) {
        incrementMinor
    }
    if($commitMessage.StartsWith("fix(")) {
        incrementPatch
    }
}

getVersion
print
incrementMajor
incrementMinor
incrementPatch