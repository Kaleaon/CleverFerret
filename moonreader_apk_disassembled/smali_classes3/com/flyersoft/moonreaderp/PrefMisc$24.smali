.class Lcom/flyersoft/moonreaderp/PrefMisc$24;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

.field final synthetic val$linkNightView:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 893
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$24;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$24;->val$linkNightView:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 896
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefColorPick;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$24;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$24;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc;->res:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->link_color_night:I

    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    sget v4, Lcom/flyersoft/tools/A;->linkColorNight:I

    new-instance v5, Lcom/flyersoft/moonreaderp/PrefMisc$24$1;

    invoke-direct {v5, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$24$1;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc$24;)V

    const/4 v3, 0x1

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/moonreaderp/PrefColorPick;-><init>(Landroid/content/Context;Ljava/lang/String;ZILcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;)V

    .line 902
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->show()V

    return-void
.end method
