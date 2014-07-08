queryPreSave = (userId, changes) ->

share.Queries.before.insert (userId, query) ->
  query._id = query._id || Random.id()
  now = new Date()
  _.defaults(query,
    string: ""
    result: ""
    stale: true
    isNew: true
    ownerId: userId
    updatedAt: now
    createdAt: now
  , share.queryResetValues)
  queryPreSave.call(@, userId, query)

share.Queries.before.update (userId, query, fieldNames, modifier, options) ->
  now = new Date()
  modifier.$set = modifier.$set or {}
  modifier.$set.updatedAt = modifier.$set.updatedAt or now
  queryPreSave.call(@, userId, modifier.$set)

share.queryResetValues =
  startRecNum: 1
  sortField: ""
  sortReverse: true