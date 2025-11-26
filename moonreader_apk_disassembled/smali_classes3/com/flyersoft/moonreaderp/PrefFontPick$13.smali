.class Lcom/flyersoft/moonreaderp/PrefFontPick$13;
.super Ljava/lang/Object;
.source "PrefFontPick.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFontPick;->setFontReplaceItemProperties(Landroid/content/Context;Landroid/widget/LinearLayout;Landroid/view/View;Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$et2:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/widget/TextView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 438
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$13;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$13;->val$et2:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 441
    sget-object p1, Lcom/flyersoft/tools/A;->outerFontsFolder:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getLocalFontfaces(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 442
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefFontPick;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$13;->val$context:Landroid/content/Context;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefFontPick$13$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefFontPick$13$1;-><init>(Lcom/flyersoft/moonreaderp/PrefFontPick$13;)V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$13;->val$et2:Landroid/widget/TextView;

    .line 447
    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {p1, v0, v1, v2, v3}, Lcom/flyersoft/moonreaderp/PrefFontPick;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;Ljava/lang/String;Z)V

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefFontPick;->show()V

    return-void
.end method
