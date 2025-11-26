.class Lcom/flyersoft/moonreaderp/ActivityTxt$205;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfOpen2(Ljava/lang/String;)V
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

    .line 19351
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$205;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 19354
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$205;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mshowPdfRenderEngineOption(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    return-void
.end method
