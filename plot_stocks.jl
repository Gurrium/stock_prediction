using DataFrames, CSV
using Plots;pyplot()
using TimeSeries

function regularization(arr)
  arr ./ maximum(arr)
end

nikkei = CSV.read("n225_.csv")
cyber = CSV.read("cyber_.csv")

plot(cyber[:date], [regularization(nikkei[:close]), regularization(cyber[:close])], labels = ["nikkei", "cyber"])

plot(moving(TimeArray([r for r in cyber[:date]], cyber[:close], ["cyber"]), mean, 35))
