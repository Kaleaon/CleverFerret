.class Lcom/flyersoft/moonreaderp/ActivityMain$58;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/webkit/DownloadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->showHtmlLibrary(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 5704
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$58;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadStart(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    .line 5707
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "*onDownloadStart : "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 p3, 0x1

    new-array p4, p3, [Ljava/lang/Object;

    const/4 p5, 0x0

    aput-object p2, p4, p5

    invoke-static {p4}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 5708
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$58;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p2, p1, p3}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mdoDownloadStartThread(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;Z)V

    return-void
.end method
