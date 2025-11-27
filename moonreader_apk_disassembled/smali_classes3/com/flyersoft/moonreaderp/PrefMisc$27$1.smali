.class Lcom/flyersoft/moonreaderp/PrefMisc$27$1;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc$27;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefMisc$27;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc$27;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 933
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$27$1;->this$1:Lcom/flyersoft/moonreaderp/PrefMisc$27;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getColor(I)V
    .locals 1

    .line 935
    sput p1, Lcom/radaee/pdf/Global;->annotTransparencyColor:I

    .line 936
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$27$1;->this$1:Lcom/flyersoft/moonreaderp/PrefMisc$27;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc$27;->val$pdfColorView:Landroid/view/View;

    sget v0, Lcom/radaee/pdf/Global;->annotTransparencyColor:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 937
    sget-boolean p1, Lcom/radaee/pdf/Global;->ms_init:Z

    if-eqz p1, :cond_0

    .line 938
    sget p1, Lcom/radaee/pdf/Global;->annotTransparencyColor:I

    invoke-static {p1}, Lcom/radaee/pdf/Global;->setAnnotTransparency(I)V

    :cond_0
    return-void
.end method
