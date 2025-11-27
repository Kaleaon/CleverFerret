.class Lcom/flyersoft/components/cloud/Sync$24$1;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync$24;->afterDownload(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Sync$24;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Sync$24;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1162
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Sync$24$1;->this$0:Lcom/flyersoft/components/cloud/Sync$24;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    const/4 v0, 0x0

    .line 1165
    invoke-static {v0}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smrefreshShelfCovers(Z)V

    return-void
.end method
