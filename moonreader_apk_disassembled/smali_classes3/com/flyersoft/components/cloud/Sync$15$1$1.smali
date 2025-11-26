.class Lcom/flyersoft/components/cloud/Sync$15$1$1;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Lcom/flyersoft/components/cloud/Cloud$AfterUpload;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync$15$1;->afterUpload(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/components/cloud/Sync$15$1;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Sync$15$1;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 743
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Sync$15$1$1;->this$1:Lcom/flyersoft/components/cloud/Sync$15$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterUpload(Ljava/lang/String;)V
    .locals 0

    .line 746
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->uploadBooksSortFiles()V

    return-void
.end method
