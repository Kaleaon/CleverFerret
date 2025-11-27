.class Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$1;
.super Ljava/lang/Object;
.source "PrefTheme.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 392
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 395
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 396
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefTheme;->selectState:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 397
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->checked:[Z

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->checked:[Z

    aget-boolean v2, v2, p1

    xor-int/2addr v1, v2

    aput-boolean v1, v0, p1

    .line 398
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->notifyDataSetChanged()V

    return-void

    .line 400
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefTheme;->pdf:Lcom/flyersoft/books/PDFReader;

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/A;->getThemeList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/A$PageTheme;

    iget-object p1, p1, Lcom/flyersoft/tools/A$PageTheme;->pName:Ljava/lang/String;

    .line 401
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefTheme;->forSave:Z

    if-eqz v0, :cond_2

    .line 402
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefTheme;->nameEdit:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 403
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefTheme;->phTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 405
    :cond_2
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_3

    return-void

    .line 407
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefTheme;->onGetTheme:Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;

    if-eqz v0, :cond_4

    .line 408
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefTheme;->onGetTheme:Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;

    invoke-interface {v0, p1}, Lcom/flyersoft/moonreaderp/PrefTheme$OnGetTheme;->getTheme(Ljava/lang/String;)V

    .line 409
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    iput-boolean v1, p1, Lcom/flyersoft/moonreaderp/PrefTheme;->themeChanged:Z

    .line 410
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefTheme$ThemeAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefTheme;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefTheme;->dismiss()V

    return-void
.end method
