.class Lcom/flyersoft/moonreaderp/PrefPdf$2;
.super Ljava/lang/Object;
.source "PrefPdf.java"

# interfaces
.implements Lcom/flyersoft/views/CustomSeek$OnProgressChanged;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefPdf;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefPdf;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefPdf;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 137
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefPdf$2;->this$0:Lcom/flyersoft/moonreaderp/PrefPdf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onValueRecive(I)V
    .locals 1

    .line 140
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf$2;->this$0:Lcom/flyersoft/moonreaderp/PrefPdf;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefPdf;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean v0, v0, Lcom/flyersoft/books/PDFReader;->isPdf:Z

    if-eqz v0, :cond_0

    .line 141
    sput p1, Lcom/flyersoft/tools/A;->pdf_page_gap:I

    return-void

    .line 143
    :cond_0
    sput p1, Lcom/flyersoft/tools/A;->djvu_page_gap:I

    return-void
.end method
