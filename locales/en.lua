local Translations = {
    error = {},
    info = {},
    success = {}
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})