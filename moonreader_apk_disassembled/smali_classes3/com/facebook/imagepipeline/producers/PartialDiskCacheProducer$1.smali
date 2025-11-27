.class Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;
.super Ljava/lang/Object;
.source "PartialDiskCacheProducer.java"

# interfaces
.implements Lbolts/Continuation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer;->onFinishDiskReads(Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;Lcom/facebook/cache/common/CacheKey;)Lbolts/Continuation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lbolts/Continuation<",
        "Lcom/facebook/imagepipeline/image/EncodedImage;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer;

.field final synthetic val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

.field final synthetic val$listener:Lcom/facebook/imagepipeline/producers/ProducerListener2;

.field final synthetic val$partialImageCacheKey:Lcom/facebook/cache/common/CacheKey;

.field final synthetic val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;


# direct methods
.method constructor <init>(Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer;Lcom/facebook/imagepipeline/producers/ProducerListener2;Lcom/facebook/imagepipeline/producers/ProducerContext;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/cache/common/CacheKey;)V
    .locals 0

    .line 129
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->this$0:Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer;

    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$listener:Lcom/facebook/imagepipeline/producers/ProducerListener2;

    iput-object p3, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    iput-object p4, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    iput-object p5, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$partialImageCacheKey:Lcom/facebook/cache/common/CacheKey;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic then(Lbolts/Task;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 129
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->then(Lbolts/Task;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public then(Lbolts/Task;)Ljava/lang/Void;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lbolts/Task<",
            "Lcom/facebook/imagepipeline/image/EncodedImage;",
            ">;)",
            "Ljava/lang/Void;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 133
    invoke-static {p1}, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer;->-$$Nest$smisTaskCancelled(Lbolts/Task;)Z

    move-result v0

    const/4 v1, 0x0

    const-string v2, "PartialDiskCacheProducer"

    if-eqz v0, :cond_0

    .line 134
    iget-object p1, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$listener:Lcom/facebook/imagepipeline/producers/ProducerListener2;

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    invoke-interface {p1, v0, v2, v1}, Lcom/facebook/imagepipeline/producers/ProducerListener2;->onProducerFinishWithCancellation(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Ljava/util/Map;)V

    .line 135
    iget-object p1, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    invoke-interface {p1}, Lcom/facebook/imagepipeline/producers/Consumer;->onCancellation()V

    goto/16 :goto_0

    .line 136
    :cond_0
    invoke-virtual {p1}, Lbolts/Task;->isFaulted()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 137
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$listener:Lcom/facebook/imagepipeline/producers/ProducerListener2;

    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 138
    invoke-virtual {p1}, Lbolts/Task;->getError()Ljava/lang/Exception;

    move-result-object p1

    .line 137
    invoke-interface {v0, v3, v2, p1, v1}, Lcom/facebook/imagepipeline/producers/ProducerListener2;->onProducerFinishWithFailure(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;)V

    .line 139
    iget-object p1, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->this$0:Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer;

    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$partialImageCacheKey:Lcom/facebook/cache/common/CacheKey;

    invoke-static {p1, v0, v2, v3, v1}, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer;->-$$Nest$mstartInputProducer(Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/image/EncodedImage;)V

    goto/16 :goto_0

    .line 141
    :cond_1
    invoke-virtual {p1}, Lbolts/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/imagepipeline/image/EncodedImage;

    if-eqz p1, :cond_3

    .line 143
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$listener:Lcom/facebook/imagepipeline/producers/ProducerListener2;

    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    .line 146
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getSize()I

    move-result v4

    const/4 v5, 0x1

    invoke-static {v0, v3, v5, v4}, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer;->getExtraMap(Lcom/facebook/imagepipeline/producers/ProducerListener2;Lcom/facebook/imagepipeline/producers/ProducerContext;ZI)Ljava/util/Map;

    move-result-object v4

    .line 143
    invoke-interface {v0, v3, v2, v4}, Lcom/facebook/imagepipeline/producers/ProducerListener2;->onProducerFinishWithSuccess(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Ljava/util/Map;)V

    .line 147
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getSize()I

    move-result v0

    sub-int/2addr v0, v5

    invoke-static {v0}, Lcom/facebook/imagepipeline/common/BytesRange;->toMax(I)Lcom/facebook/imagepipeline/common/BytesRange;

    move-result-object v0

    .line 148
    invoke-virtual {p1, v0}, Lcom/facebook/imagepipeline/image/EncodedImage;->setBytesRange(Lcom/facebook/imagepipeline/common/BytesRange;)V

    .line 151
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/image/EncodedImage;->getSize()I

    move-result v3

    .line 152
    iget-object v4, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    invoke-interface {v4}, Lcom/facebook/imagepipeline/producers/ProducerContext;->getImageRequest()Lcom/facebook/imagepipeline/request/ImageRequest;

    move-result-object v4

    .line 154
    invoke-virtual {v4}, Lcom/facebook/imagepipeline/request/ImageRequest;->getBytesRange()Lcom/facebook/imagepipeline/common/BytesRange;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/facebook/imagepipeline/common/BytesRange;->contains(Lcom/facebook/imagepipeline/common/BytesRange;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 155
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    const-string v3, "disk"

    const-string v4, "partial"

    invoke-interface {v0, v3, v4}, Lcom/facebook/imagepipeline/producers/ProducerContext;->putOriginExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$listener:Lcom/facebook/imagepipeline/producers/ProducerListener2;

    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    invoke-interface {v0, v3, v2, v5}, Lcom/facebook/imagepipeline/producers/ProducerListener2;->onUltimateProducerReached(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Z)V

    .line 157
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    const/16 v2, 0x9

    invoke-interface {v0, p1, v2}, Lcom/facebook/imagepipeline/producers/Consumer;->onNewResult(Ljava/lang/Object;I)V

    goto :goto_0

    .line 159
    :cond_2
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    const/16 v2, 0x8

    invoke-interface {v0, p1, v2}, Lcom/facebook/imagepipeline/producers/Consumer;->onNewResult(Ljava/lang/Object;I)V

    .line 163
    invoke-static {v4}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->fromRequest(Lcom/facebook/imagepipeline/request/ImageRequest;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    move-result-object v0

    sub-int/2addr v3, v5

    .line 164
    invoke-static {v3}, Lcom/facebook/imagepipeline/common/BytesRange;->from(I)Lcom/facebook/imagepipeline/common/BytesRange;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->setBytesRange(Lcom/facebook/imagepipeline/common/BytesRange;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    move-result-object v0

    .line 165
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->build()Lcom/facebook/imagepipeline/request/ImageRequest;

    move-result-object v0

    .line 166
    new-instance v2, Lcom/facebook/imagepipeline/producers/SettableProducerContext;

    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    invoke-direct {v2, v0, v3}, Lcom/facebook/imagepipeline/producers/SettableProducerContext;-><init>(Lcom/facebook/imagepipeline/request/ImageRequest;Lcom/facebook/imagepipeline/producers/ProducerContext;)V

    .line 169
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->this$0:Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer;

    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    iget-object v4, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$partialImageCacheKey:Lcom/facebook/cache/common/CacheKey;

    invoke-static {v0, v3, v2, v4, p1}, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer;->-$$Nest$mstartInputProducer(Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/image/EncodedImage;)V

    goto :goto_0

    .line 173
    :cond_3
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$listener:Lcom/facebook/imagepipeline/producers/ProducerListener2;

    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    const/4 v4, 0x0

    .line 174
    invoke-static {v0, v3, v4, v4}, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer;->getExtraMap(Lcom/facebook/imagepipeline/producers/ProducerListener2;Lcom/facebook/imagepipeline/producers/ProducerContext;ZI)Ljava/util/Map;

    move-result-object v4

    .line 173
    invoke-interface {v0, v3, v2, v4}, Lcom/facebook/imagepipeline/producers/ProducerListener2;->onProducerFinishWithSuccess(Lcom/facebook/imagepipeline/producers/ProducerContext;Ljava/lang/String;Ljava/util/Map;)V

    .line 175
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->this$0:Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer;

    iget-object v2, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$consumer:Lcom/facebook/imagepipeline/producers/Consumer;

    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$producerContext:Lcom/facebook/imagepipeline/producers/ProducerContext;

    iget-object v4, p0, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer$1;->val$partialImageCacheKey:Lcom/facebook/cache/common/CacheKey;

    invoke-static {v0, v2, v3, v4, p1}, Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer;->-$$Nest$mstartInputProducer(Lcom/facebook/imagepipeline/producers/PartialDiskCacheProducer;Lcom/facebook/imagepipeline/producers/Consumer;Lcom/facebook/imagepipeline/producers/ProducerContext;Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/image/EncodedImage;)V

    :goto_0
    return-object v1
.end method
