.class Lcom/flyersoft/moonreaderp/PrefDownloadCover$1;
.super Ljava/lang/Object;
.source "PrefDownloadCover.java"

# interfaces
.implements Landroid/webkit/DownloadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefDownloadCover;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefDownloadCover;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 152
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$1;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadStart(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    .line 155
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "*onDownloadStart : "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 p3, 0x1

    new-array p3, p3, [Ljava/lang/Object;

    const/4 p4, 0x0

    aput-object p2, p3, p4

    invoke-static {p3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 156
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$1;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget p2, p2, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->type:I

    const/4 p3, 0x2

    if-ne p2, p3, :cond_0

    .line 157
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$1;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-static {p2, p1}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->-$$Nest$mdownloadFontFile(Lcom/flyersoft/moonreaderp/PrefDownloadCover;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
