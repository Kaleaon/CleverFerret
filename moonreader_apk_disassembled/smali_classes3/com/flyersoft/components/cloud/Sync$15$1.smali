.class Lcom/flyersoft/components/cloud/Sync$15$1;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Lcom/flyersoft/components/cloud/Cloud$AfterUpload;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync$15;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Sync$15;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Sync$15;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 739
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Sync$15$1;->this$0:Lcom/flyersoft/components/cloud/Sync$15;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterUpload(Ljava/lang/String;)V
    .locals 6

    .line 742
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->instance()Lcom/flyersoft/components/cloud/Cloud;

    move-result-object v0

    sget p1, Lcom/flyersoft/tools/A;->syncType:I

    invoke-static {p1}, Lcom/flyersoft/components/cloud/Cloud;->getShelfBooksDeviceFile(I)Ljava/lang/String;

    move-result-object v1

    sget-object p1, Lcom/flyersoft/tools/A;->deviceRandomID:Ljava/lang/String;

    .line 743
    invoke-static {p1}, Lcom/flyersoft/tools/T;->String2InputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    sget-object v3, Lcom/flyersoft/tools/A;->deviceRandomID:Ljava/lang/String;

    new-instance v4, Lcom/flyersoft/components/cloud/Sync$15$1$1;

    invoke-direct {v4, p0}, Lcom/flyersoft/components/cloud/Sync$15$1$1;-><init>(Lcom/flyersoft/components/cloud/Sync$15$1;)V

    const/4 v5, 0x1

    .line 742
    invoke-virtual/range {v0 .. v5}, Lcom/flyersoft/components/cloud/Cloud;->uploadFromInputStream(Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;Lcom/flyersoft/components/cloud/Cloud$AfterUpload;Z)V

    return-void
.end method
