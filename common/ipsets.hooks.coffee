share.IPSets.before.update (userId, ipset, fieldNames, modifier, options) ->
  if _.intersection(fieldNames, ["contents"]).length
    modifier.$set = modifier.$set or {}
    modifier.$set.isStale = true
