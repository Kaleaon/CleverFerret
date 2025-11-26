.class public Lcom/flyersoft/moonreaderp/PrefEditBookmark;
.super Ljava/lang/Object;
.source "PrefEditBookmark.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefEditBookmark$OnAfterEdit;
    }
.end annotation


# instance fields
.field colorCb:Landroid/widget/CheckBox;

.field colorLay:Landroid/view/View;

.field colorV:Landroid/view/View;

.field editColor:Ljava/lang/Integer;

.field et:Landroid/widget/EditText;

.field noAskCb:Landroid/widget/CheckBox;

.field onAfterEdit:Lcom/flyersoft/moonreaderp/PrefEditBookmark$OnAfterEdit;

.field res:Landroid/content/Context;

.field root:Landroid/view/View;

.field text:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefEditBookmark$OnAfterEdit;Ljava/lang/Integer;Landroid/view/View;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->res:Landroid/content/Context;

    .line 28
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->text:Ljava/lang/String;

    .line 29
    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->onAfterEdit:Lcom/flyersoft/moonreaderp/PrefEditBookmark$OnAfterEdit;

    .line 30
    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->editColor:Ljava/lang/Integer;

    .line 32
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget p3, Lcom/flyersoft/moonreaderp/R$layout;->pref_edit_bookmark2:I

    const/4 p4, 0x0

    invoke-virtual {p2, p3, p4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->root:Landroid/view/View;

    .line 33
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->initView()V

    .line 35
    new-instance p2, Lcom/flyersoft/components/MyDialog;

    invoke-direct {p2, p1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget p1, Lcom/flyersoft/moonreaderp/R$string;->add_bookmark:I

    .line 36
    invoke-virtual {p2, p1}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->root:Landroid/view/View;

    .line 37
    invoke-virtual {p1, p2}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance p2, Lcom/flyersoft/moonreaderp/PrefEditBookmark$2;

    invoke-direct {p2, p0, p5}, Lcom/flyersoft/moonreaderp/PrefEditBookmark$2;-><init>(Lcom/flyersoft/moonreaderp/PrefEditBookmark;Landroid/view/View;)V

    const p3, 0x104000a

    .line 38
    invoke-virtual {p1, p3, p2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 p2, 0x1040000

    .line 51
    invoke-virtual {p1, p2, p4}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance p2, Lcom/flyersoft/moonreaderp/PrefEditBookmark$1;

    invoke-direct {p2, p0, p5}, Lcom/flyersoft/moonreaderp/PrefEditBookmark$1;-><init>(Lcom/flyersoft/moonreaderp/PrefEditBookmark;Landroid/view/View;)V

    .line 52
    invoke-virtual {p1, p2}, Lcom/flyersoft/components/MyDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 58
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method private initView()V
    .locals 3

    .line 66
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->noteEt:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->et:Landroid/widget/EditText;

    .line 67
    sget-boolean v1, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v1, :cond_0

    const/high16 v1, 0x41900000    # 18.0f

    goto :goto_0

    :cond_0
    const/high16 v1, 0x41800000    # 16.0f

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTextSize(F)V

    .line 69
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->checkBox2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->colorCb:Landroid/widget/CheckBox;

    .line 70
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->checkBox:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->noAskCb:Landroid/widget/CheckBox;

    .line 71
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->colorV:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->colorV:Landroid/view/View;

    .line 72
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->colorLay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->colorLay:Landroid/view/View;

    .line 73
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 74
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->noAskCb:Landroid/widget/CheckBox;

    sget-boolean v1, Lcom/flyersoft/tools/A;->bookmarkManually:Z

    const/4 v2, 0x1

    xor-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 76
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->et:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 77
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->colorV:Landroid/view/View;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->editColor:Ljava/lang/Integer;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_1

    :cond_1
    sget v1, Lcom/flyersoft/tools/A;->bookmark_color:I

    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 78
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->colorCb:Landroid/widget/CheckBox;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->editColor:Ljava/lang/Integer;

    if-nez v1, :cond_2

    sget-boolean v1, Lcom/flyersoft/tools/A;->bookmarkNoColor:Z

    if-eqz v1, :cond_4

    :cond_2
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->editColor:Ljava/lang/Integer;

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_2

    :cond_3
    const/4 v2, 0x0

    :cond_4
    :goto_2
    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 79
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->colorCb:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-nez v0, :cond_5

    .line 80
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->colorLay:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 81
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->colorCb:Landroid/widget/CheckBox;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefEditBookmark$3;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefEditBookmark$3;-><init>(Lcom/flyersoft/moonreaderp/PrefEditBookmark;)V

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    :cond_5
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7

    .line 95
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->colorLay:Landroid/view/View;

    if-ne p1, v0, :cond_0

    .line 96
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefColorPick;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;->res:Landroid/content/Context;

    sget p1, Lcom/flyersoft/moonreaderp/R$string;->bookmark:I

    invoke-virtual {v2, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    sget v5, Lcom/flyersoft/tools/A;->bookmark_color:I

    new-instance v6, Lcom/flyersoft/moonreaderp/PrefEditBookmark$4;

    invoke-direct {v6, p0}, Lcom/flyersoft/moonreaderp/PrefEditBookmark$4;-><init>(Lcom/flyersoft/moonreaderp/PrefEditBookmark;)V

    const/4 v4, 0x1

    invoke-direct/range {v1 .. v6}, Lcom/flyersoft/moonreaderp/PrefColorPick;-><init>(Landroid/content/Context;Ljava/lang/String;ZILcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;)V

    .line 106
    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefColorPick;->show()V

    :cond_0
    return-void
.end method
