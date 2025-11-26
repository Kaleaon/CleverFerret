.class Lcom/flyersoft/moonreaderp/PrefPdf$4;
.super Ljava/lang/Object;
.source "PrefPdf.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefPdf;->setPageImagesClick()V
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

    .line 161
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefPdf$4;->this$0:Lcom/flyersoft/moonreaderp/PrefPdf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 164
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result p1

    .line 165
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefPdf$4;->this$0:Lcom/flyersoft/moonreaderp/PrefPdf;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PrefPdf;->-$$Nest$mrenderPageSelected(Lcom/flyersoft/moonreaderp/PrefPdf;I)V

    return-void
.end method
