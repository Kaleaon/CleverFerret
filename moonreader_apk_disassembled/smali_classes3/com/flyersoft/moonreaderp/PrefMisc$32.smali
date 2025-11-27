.class Lcom/flyersoft/moonreaderp/PrefMisc$32;
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

.field final synthetic val$fontColorNight:Landroid/view/View;

.field final synthetic val$nighttextStr:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc;Ljava/lang/String;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1021
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$32;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$32;->val$nighttextStr:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$32;->val$fontColorNight:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 1024
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefColorPick;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$32;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$32;->val$nighttextStr:Ljava/lang/String;

    sget v4, Lcom/flyersoft/tools/A;->noteTextColorNight:I

    new-instance v5, Lcom/flyersoft/moonreaderp/PrefMisc$32$1;

    invoke-direct {v5, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$32$1;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc$32;)V

    const/4 v3, 0x1

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/moonreaderp/PrefColorPick;-><init>(Landroid/content/Context;Ljava/lang/String;ZILcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;)V

    .line 1030
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->show()V

    return-void
.end method
