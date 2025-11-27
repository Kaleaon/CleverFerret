.class Lcom/radaee/reader/PDFPagesAct$1;
.super Ljava/lang/Object;
.source "PDFPagesAct.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/PDFPagesAct;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/reader/PDFPagesAct;


# direct methods
.method constructor <init>(Lcom/radaee/reader/PDFPagesAct;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 28
    iput-object p1, p0, Lcom/radaee/reader/PDFPagesAct$1;->this$0:Lcom/radaee/reader/PDFPagesAct;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 31
    iget-object p1, p0, Lcom/radaee/reader/PDFPagesAct$1;->this$0:Lcom/radaee/reader/PDFPagesAct;

    invoke-virtual {p1}, Lcom/radaee/reader/PDFPagesAct;->finish()V

    return-void
.end method
