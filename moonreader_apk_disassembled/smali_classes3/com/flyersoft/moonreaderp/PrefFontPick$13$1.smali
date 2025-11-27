.class Lcom/flyersoft/moonreaderp/PrefFontPick$13$1;
.super Ljava/lang/Object;
.source "PrefFontPick.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFontPick$13;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefFontPick$13;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFontPick$13;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 442
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$13$1;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick$13;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getFont(Ljava/lang/String;Z)V
    .locals 0

    if-eqz p1, :cond_0

    .line 445
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$13$1;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick$13;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefFontPick$13;->val$et2:Landroid/widget/TextView;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method
