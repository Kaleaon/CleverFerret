.class Lcom/flyersoft/moonreaderp/PrefTheme$12;
.super Ljava/lang/Object;
.source "PrefTheme.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefTheme;->doImportThemeFinal(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefTheme;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefTheme;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 794
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$12;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 797
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$12;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefTheme;->colorCheck:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 798
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$12;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object p2, p1, Lcom/flyersoft/moonreaderp/PrefTheme;->colorCheck:Landroid/widget/CheckBox;

    invoke-virtual {p2}, Landroid/widget/CheckBox;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/PrefTheme;->scrollToTitle(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
