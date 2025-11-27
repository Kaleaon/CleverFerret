.class Lcom/flyersoft/moonreaderp/ActivityTxt$204;
.super Ljava/lang/Thread;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfOpen(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 19264
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$204;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 19266
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$204;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    new-instance v1, Lorg/comic/CDocument;

    invoke-direct {v1}, Lorg/comic/CDocument;-><init>()V

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->cbz_doc:Lorg/comic/CDocument;

    .line 19267
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$204;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->cbz_doc:Lorg/comic/CDocument;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$204;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf_filename:Ljava/lang/String;

    sget v3, Lcom/radaee/pdf/Global;->def_view:I

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$204;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v4, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->baseFrame:Landroid/widget/FrameLayout;

    .line 19268
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$204;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetprogressDlg(Lcom/flyersoft/moonreaderp/ActivityTxt;)Landroid/app/Dialog;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$204;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    :goto_0
    move-object v5, v0

    const/16 v6, 0x3d8

    .line 19267
    invoke-virtual/range {v1 .. v6}, Lorg/comic/CDocument;->Open(Ljava/lang/String;ILandroid/view/View;Landroid/os/Handler;I)Ljava/lang/String;

    move-result-object v0

    .line 19269
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$204;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    new-instance v2, Lcom/flyersoft/moonreaderp/ActivityTxt$204$1;

    invoke-direct {v2, p0, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt$204$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$204;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
