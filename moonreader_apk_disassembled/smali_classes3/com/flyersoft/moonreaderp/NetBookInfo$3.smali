.class Lcom/flyersoft/moonreaderp/NetBookInfo$3;
.super Ljava/lang/Object;
.source "NetBookInfo.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/NetBookInfo;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/NetBookInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 265
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$3;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 1

    .line 268
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$3;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/NetBookInfo;->-$$Nest$mdoDownload(Lcom/flyersoft/moonreaderp/NetBookInfo;I)V

    .line 269
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$3;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->-$$Nest$mshowDownloadProgress(Lcom/flyersoft/moonreaderp/NetBookInfo;I)V

    return-void
.end method
