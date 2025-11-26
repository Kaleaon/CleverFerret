.class Lcom/radaee/util/PDFThumbGrid$1;
.super Ljava/lang/Object;
.source "PDFThumbGrid.java"

# interfaces
.implements Lcom/radaee/view/PDFViewThumb$PDFThumbListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/util/PDFThumbGrid;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/util/PDFThumbGrid;


# direct methods
.method constructor <init>(Lcom/radaee/util/PDFThumbGrid;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 26
    iput-object p1, p0, Lcom/radaee/util/PDFThumbGrid$1;->this$0:Lcom/radaee/util/PDFThumbGrid;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnPageClicked(I)V
    .locals 1

    .line 29
    invoke-static {}, Lcom/radaee/util/RadaeePluginCallback;->getInstance()Lcom/radaee/util/RadaeePluginCallback;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/radaee/util/RadaeePluginCallback;->onThumbPageClick(I)V

    .line 30
    iget-object p1, p0, Lcom/radaee/util/PDFThumbGrid$1;->this$0:Lcom/radaee/util/PDFThumbGrid;

    invoke-virtual {p1}, Lcom/radaee/util/PDFThumbGrid;->finish()V

    return-void
.end method
