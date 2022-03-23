defmodule Reticle.BucketTest do
  use ExUnit.Case, async: true

  setup do
    { :ok, bucket } = Reticle.Bucket.start_link([])
    %{bucket: bucket}
  end

  test "stores values by key and deletes them", %{bucket: bucket} do
    assert Reticle.Bucket.get(bucket, "milk") == nil

    Reticle.Bucket.put(bucket, "milk", 3)
    assert Reticle.Bucket.get(bucket, "milk") == 3

    Reticle.Bucket.delete(bucket, "milk")
    assert Reticle.Bucket.get(bucket, "milk") == nil
  end
end