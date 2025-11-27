.class Lcom/flyersoft/moonreaderp/PrefMisc$43;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->showAutoScrollSettings(Landroid/content/Context;Z)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1242
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$43;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1245
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$43;->val$context:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    const-string v1, "tips_autoscroll.png"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/flyersoft/tools/A;->getDrawableFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/high16 v1, 0x3a000000

    invoke-static {p1, v0, v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->showTipImage(Landroid/content/Context;Landroid/graphics/drawable/Drawable;I)V

    return-void
.end method
