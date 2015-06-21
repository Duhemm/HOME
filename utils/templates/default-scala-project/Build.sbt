lazy val sharedSettings = Defaults.defaultSettings ++ Seq(
    scalaVersion := "2.11.6",
    version := "0.0.1",
    organization := "org.duhemm",
    description := "[DESCRIPTION]"
  ) ++ Formatting.sbtFilesSettings

lazy val [NAME] =
  project in file(".") settings (
    name := "[NAME]"
  ) settings (
    sharedSettings: _*
  )
