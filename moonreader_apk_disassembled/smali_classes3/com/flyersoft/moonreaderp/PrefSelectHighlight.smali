.class public Lcom/flyersoft/moonreaderp/PrefSelectHighlight;
.super Lcom/flyersoft/moonreaderp/PrefOptions;
.source "PrefSelectHighlight.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefSelectHighlight$OnSelectColor;
    }
.end annotation


# instance fields
.field allCb:Landroid/widget/CheckBox;

.field b1:Landroid/widget/Button;

.field b2:Landroid/widget/Button;

.field cb1:Landroid/widget/RadioButton;

.field cb2:Landroid/widget/RadioButton;

.field cb3:Landroid/widget/RadioButton;

.field cb4:Landroid/widget/RadioButton;

.field color1:Landroid/view/View;

.field color2:Landroid/view/View;

.field color3:Landroid/view/View;

.field color4:Landroid/view/View;

.field directCb:Landroid/widget/CheckBox;

.field hView2:Landroid/view/View;

.field hView3:Landroid/view/View;

.field hView4:Landroid/view/View;

.field highlightAllWord:Ljava/lang/String;

.field highlightMode:I

.field isPdf:Z

.field magnifierCb:Landroid/widget/CheckBox;

.field onSelectColor:Lcom/flyersoft/moonreaderp/PrefSelectHighlight$OnSelectColor;

.field selfPref:Lcom/flyersoft/moonreaderp/PrefSelectHighlight;

.field styleCb:Landroid/widget/CheckBox;

.field templateCb:Landroid/widget/CheckBox;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefSelectHighlight$OnSelectColor;ZILjava/lang/String;)V
    .locals 7

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    .line 30
    invoke-direct/range {v0 .. v6}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefSelectHighlight$OnSelectColor;ZILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefSelectHighlight$OnSelectColor;ZILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 34
    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->highlight_pop:I

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;-><init>(Landroid/content/Context;I)V

    .line 35
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->onSelectColor:Lcom/flyersoft/moonreaderp/PrefSelectHighlight$OnSelectColor;

    .line 36
    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->isPdf:Z

    .line 37
    iput p4, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->highlightMode:I

    if-eqz p5, :cond_1

    .line 38
    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result p1

    sget-boolean p2, Lcom/flyersoft/tools/A;->isAsiaLanguage:Z

    if-eqz p2, :cond_0

    const/16 p2, 0x32

    goto :goto_0

    :cond_0
    const/16 p2, 0x64

    :goto_0
    if-ge p1, p2, :cond_1

    .line 39
    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->highlightAllWord:Ljava/lang/String;

    .line 40
    :cond_1
    invoke-virtual {p0, p6}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->scrollToTitle(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public initView()V
    .locals 9

    .line 62
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->okB:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->b1:Landroid/widget/Button;

    .line 63
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cancelB:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->b2:Landroid/widget/Button;

    .line 64
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->b1:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->b2:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 67
    iput-object p0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->selfPref:Lcom/flyersoft/moonreaderp/PrefSelectHighlight;

    .line 68
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->color1:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->color1:Landroid/view/View;

    .line 69
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->color2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->color2:Landroid/view/View;

    .line 70
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->color3:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->color3:Landroid/view/View;

    .line 71
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->color4:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->color4:Landroid/view/View;

    .line 72
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->View2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->hView2:Landroid/view/View;

    .line 73
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->View3:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->hView3:Landroid/view/View;

    .line 74
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->View4:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->hView4:Landroid/view/View;

    .line 75
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->radioButton1:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb1:Landroid/widget/RadioButton;

    .line 76
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->radioButton2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb2:Landroid/widget/RadioButton;

    .line 77
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->radioButton3:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb3:Landroid/widget/RadioButton;

    .line 78
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->radioButton4:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb4:Landroid/widget/RadioButton;

    .line 79
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->styleCb:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->styleCb:Landroid/widget/CheckBox;

    .line 80
    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 81
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->styleCb:Landroid/widget/CheckBox;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->res:Landroid/content/Context;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->last_highlight_as_text_selection:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " (& TTS)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 82
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->checkBox1:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->templateCb:Landroid/widget/CheckBox;

    .line 83
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->CheckBox2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->directCb:Landroid/widget/CheckBox;

    .line 84
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->CheckBox3:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->magnifierCb:Landroid/widget/CheckBox;

    .line 85
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->CheckBox4:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->allCb:Landroid/widget/CheckBox;

    .line 87
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->highlightAllWord:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    const/16 v1, 0x8

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_1

    .line 88
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->allCb:Landroid/widget/CheckBox;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setVisibility(I)V

    goto :goto_1

    .line 90
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->allCb:Landroid/widget/CheckBox;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->highlightAllWord:Ljava/lang/String;

    invoke-static {v4}, Lcom/flyersoft/tools/A;->getHighlightAllItem(Ljava/lang/String;)Lcom/flyersoft/tools/A$HighlightAll;

    move-result-object v4

    if-eqz v4, :cond_2

    const/4 v4, 0x1

    goto :goto_0

    :cond_2
    const/4 v4, 0x0

    :goto_0
    invoke-virtual {v0, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 91
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->allCb:Landroid/widget/CheckBox;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->highlight_all:I

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "\"<b>"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->highlightAllWord:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "</b>\""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-array v7, v3, [Ljava/lang/Object;

    aput-object v6, v7, v2

    invoke-virtual {v4, v5, v7}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 94
    :goto_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->color1:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 95
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->color2:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 96
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->color3:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 97
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->color4:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 98
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->hView2:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->hView3:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 100
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->hView4:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->highlightMode:I

    const/4 v4, -0x1

    if-ne v0, v4, :cond_3

    sget v0, Lcom/flyersoft/tools/A;->highlightMode:I

    .line 103
    :cond_3
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb1:Landroid/widget/RadioButton;

    if-nez v0, :cond_4

    const/4 v6, 0x1

    goto :goto_2

    :cond_4
    const/4 v6, 0x0

    :goto_2
    invoke-virtual {v5, v6}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 104
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb2:Landroid/widget/RadioButton;

    if-ne v0, v3, :cond_5

    const/4 v6, 0x1

    goto :goto_3

    :cond_5
    const/4 v6, 0x0

    :goto_3
    invoke-virtual {v5, v6}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 105
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb3:Landroid/widget/RadioButton;

    const/4 v6, 0x2

    if-ne v0, v6, :cond_6

    const/4 v7, 0x1

    goto :goto_4

    :cond_6
    const/4 v7, 0x0

    :goto_4
    invoke-virtual {v5, v7}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 106
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb4:Landroid/widget/RadioButton;

    const/4 v7, 0x3

    if-ne v0, v7, :cond_7

    const/4 v8, 0x1

    goto :goto_5

    :cond_7
    const/4 v8, 0x0

    :goto_5
    invoke-virtual {v5, v8}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 107
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb1:Landroid/widget/RadioButton;

    invoke-virtual {v5, p0}, Landroid/widget/RadioButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 108
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb2:Landroid/widget/RadioButton;

    invoke-virtual {v5, p0}, Landroid/widget/RadioButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 109
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb3:Landroid/widget/RadioButton;

    invoke-virtual {v5, p0}, Landroid/widget/RadioButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb4:Landroid/widget/RadioButton;

    invoke-virtual {v5, p0}, Landroid/widget/RadioButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 111
    iget-boolean v5, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->isPdf:Z

    if-eqz v5, :cond_c

    iget v5, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->highlightMode:I

    if-eq v5, v4, :cond_c

    .line 112
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb1:Landroid/widget/RadioButton;

    if-nez v0, :cond_8

    const/4 v8, 0x1

    goto :goto_6

    :cond_8
    const/4 v8, 0x0

    :goto_6
    invoke-virtual {v5, v8}, Landroid/widget/RadioButton;->setEnabled(Z)V

    .line 113
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb2:Landroid/widget/RadioButton;

    if-ne v0, v3, :cond_9

    const/4 v8, 0x1

    goto :goto_7

    :cond_9
    const/4 v8, 0x0

    :goto_7
    invoke-virtual {v5, v8}, Landroid/widget/RadioButton;->setEnabled(Z)V

    .line 114
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb3:Landroid/widget/RadioButton;

    if-ne v0, v6, :cond_a

    const/4 v6, 0x1

    goto :goto_8

    :cond_a
    const/4 v6, 0x0

    :goto_8
    invoke-virtual {v5, v6}, Landroid/widget/RadioButton;->setEnabled(Z)V

    .line 115
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb4:Landroid/widget/RadioButton;

    if-ne v0, v7, :cond_b

    const/4 v2, 0x1

    :cond_b
    invoke-virtual {v5, v2}, Landroid/widget/RadioButton;->setEnabled(Z)V

    .line 117
    :cond_c
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->highlightMode:I

    if-eq v0, v4, :cond_d

    .line 118
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->b2:Landroid/widget/Button;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->delete:I

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(I)V

    .line 120
    :cond_d
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->color1:Landroid/view/View;

    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->isPdf:Z

    if-eqz v2, :cond_e

    sget v2, Lcom/flyersoft/tools/A;->pdf_select_color:I

    goto :goto_9

    :cond_e
    sget v2, Lcom/flyersoft/tools/A;->highlight_color:I

    :goto_9
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 121
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->color2:Landroid/view/View;

    sget v2, Lcom/flyersoft/tools/A;->underline_color:I

    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 122
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->color3:Landroid/view/View;

    sget v2, Lcom/flyersoft/tools/A;->strikethrough_color:I

    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 123
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->color4:Landroid/view/View;

    sget v2, Lcom/flyersoft/tools/A;->squiggly_color:I

    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 124
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->hView2:Landroid/view/View;

    sget v2, Lcom/flyersoft/tools/A;->highlight_color1:I

    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 125
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->hView3:Landroid/view/View;

    sget v2, Lcom/flyersoft/tools/A;->highlight_color2:I

    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 126
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->hView4:Landroid/view/View;

    sget v2, Lcom/flyersoft/tools/A;->highlight_color3:I

    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 128
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->isPdf:Z

    if-eqz v0, :cond_f

    .line 129
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->styleCb:Landroid/widget/CheckBox;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setVisibility(I)V

    .line 130
    :cond_f
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->styleCb:Landroid/widget/CheckBox;

    sget-boolean v2, Lcom/flyersoft/tools/A;->highlightStyleAsSelec:Z

    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 131
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->styleCb:Landroid/widget/CheckBox;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$1;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$1;-><init>(Lcom/flyersoft/moonreaderp/PrefSelectHighlight;)V

    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 136
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->directCb:Landroid/widget/CheckBox;

    sget-boolean v2, Lcom/flyersoft/tools/A;->directHighlight:Z

    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 137
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->directCb:Landroid/widget/CheckBox;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$2;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$2;-><init>(Lcom/flyersoft/moonreaderp/PrefSelectHighlight;)V

    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 142
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->magnifierCb:Landroid/widget/CheckBox;

    sget-boolean v2, Lcom/flyersoft/tools/A;->showMagnifier:Z

    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 143
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->magnifierCb:Landroid/widget/CheckBox;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$3;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$3;-><init>(Lcom/flyersoft/moonreaderp/PrefSelectHighlight;)V

    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 148
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->templateCb:Landroid/widget/CheckBox;

    sget-boolean v2, Lcom/flyersoft/tools/A;->showColorTemplate:Z

    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 149
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->templateCb:Landroid/widget/CheckBox;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$4;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$4;-><init>(Lcom/flyersoft/moonreaderp/PrefSelectHighlight;)V

    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 167
    sget-boolean v0, Lcom/flyersoft/tools/A;->showColorTemplate:Z

    if-eqz v0, :cond_10

    .line 168
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->templateCb:Landroid/widget/CheckBox;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setVisibility(I)V

    :cond_10
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 10

    .line 174
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->b1:Landroid/widget/Button;

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne p1, v0, :cond_c

    .line 175
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb2:Landroid/widget/RadioButton;

    invoke-virtual {v0}, Landroid/widget/RadioButton;->isChecked()Z

    move-result v0

    const/4 v4, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb3:Landroid/widget/RadioButton;

    invoke-virtual {v0}, Landroid/widget/RadioButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb4:Landroid/widget/RadioButton;

    invoke-virtual {v0}, Landroid/widget/RadioButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x3

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 177
    :goto_0
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->highlightAllWord:Ljava/lang/String;

    invoke-static {v5}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_8

    .line 178
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, "|"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez v0, :cond_3

    sget v4, Lcom/flyersoft/tools/A;->highlight_color:I

    goto :goto_1

    :cond_3
    if-ne v0, v3, :cond_4

    sget v4, Lcom/flyersoft/tools/A;->underline_color:I

    goto :goto_1

    :cond_4
    if-ne v0, v4, :cond_5

    .line 179
    sget v4, Lcom/flyersoft/tools/A;->strikethrough_color:I

    goto :goto_1

    :cond_5
    sget v4, Lcom/flyersoft/tools/A;->squiggly_color:I

    :goto_1
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 180
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->highlightAllWord:Ljava/lang/String;

    invoke-static {v5}, Lcom/flyersoft/tools/A;->getHighlightAllItem(Ljava/lang/String;)Lcom/flyersoft/tools/A$HighlightAll;

    move-result-object v5

    .line 181
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->allCb:Landroid/widget/CheckBox;

    invoke-virtual {v6}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v6

    if-eqz v6, :cond_7

    if-nez v5, :cond_6

    .line 183
    new-instance v5, Lcom/flyersoft/tools/A$HighlightAll;

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->highlightAllWord:Ljava/lang/String;

    invoke-direct {v5, v6, v4}, Lcom/flyersoft/tools/A$HighlightAll;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    sget-object v4, Lcom/flyersoft/tools/A;->highlightAllItems:Ljava/util/ArrayList;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 185
    invoke-static {v5}, Lcom/flyersoft/tools/A;->updateHighlightAllItem(Lcom/flyersoft/tools/A$HighlightAll;)V

    goto :goto_2

    .line 186
    :cond_6
    iget-object v6, v5, Lcom/flyersoft/tools/A$HighlightAll;->style:Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_8

    .line 187
    iput-object v4, v5, Lcom/flyersoft/tools/A$HighlightAll;->style:Ljava/lang/String;

    .line 188
    invoke-static {v5}, Lcom/flyersoft/tools/A;->updateHighlightAllItem(Lcom/flyersoft/tools/A$HighlightAll;)V

    goto :goto_2

    .line 191
    :cond_7
    invoke-static {v5, v2}, Lcom/flyersoft/tools/A;->deleteHighlightAllItem(Lcom/flyersoft/tools/A$HighlightAll;Z)V

    .line 194
    :cond_8
    :goto_2
    iget v4, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->highlightMode:I

    if-eq v4, v1, :cond_9

    iget-boolean v4, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->isPdf:Z

    if-nez v4, :cond_a

    .line 195
    :cond_9
    sput v0, Lcom/flyersoft/tools/A;->highlightMode:I

    .line 196
    :cond_a
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->onSelectColor:Lcom/flyersoft/moonreaderp/PrefSelectHighlight$OnSelectColor;

    if-eqz v4, :cond_b

    .line 197
    invoke-interface {v4, v0, v2}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$OnSelectColor;->selectColor(IZ)V

    .line 198
    :cond_b
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cancel()V

    .line 201
    :cond_c
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->b2:Landroid/widget/Button;

    if-ne p1, v0, :cond_f

    .line 202
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->highlightMode:I

    if-eq v0, v1, :cond_e

    .line 203
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->onSelectColor:Lcom/flyersoft/moonreaderp/PrefSelectHighlight$OnSelectColor;

    if-eqz v0, :cond_d

    .line 204
    invoke-interface {v0, v2, v3}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$OnSelectColor;->selectColor(IZ)V

    .line 205
    :cond_d
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cancel()V

    goto :goto_3

    .line 207
    :cond_e
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cancel()V

    .line 210
    :cond_f
    :goto_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->color1:Landroid/view/View;

    if-ne p1, v0, :cond_11

    .line 211
    new-instance v4, Lcom/flyersoft/moonreaderp/PrefColorPick;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->selfPref:Lcom/flyersoft/moonreaderp/PrefSelectHighlight;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->getContext()Landroid/content/Context;

    move-result-object v5

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->res:Landroid/content/Context;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->highlight_color:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 212
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->isPdf:Z

    if-eqz v0, :cond_10

    sget v0, Lcom/flyersoft/tools/A;->pdf_select_color:I

    goto :goto_4

    :cond_10
    sget v0, Lcom/flyersoft/tools/A;->highlight_color:I

    :goto_4
    move v8, v0

    new-instance v9, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$5;

    invoke-direct {v9, p0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$5;-><init>(Lcom/flyersoft/moonreaderp/PrefSelectHighlight;)V

    const/4 v7, 0x1

    invoke-direct/range {v4 .. v9}, Lcom/flyersoft/moonreaderp/PrefColorPick;-><init>(Landroid/content/Context;Ljava/lang/String;ZILcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;)V

    .line 221
    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/PrefColorPick;->show()V

    .line 223
    :cond_11
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->color2:Landroid/view/View;

    if-ne p1, v0, :cond_12

    .line 224
    new-instance v4, Lcom/flyersoft/moonreaderp/PrefColorPick;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->selfPref:Lcom/flyersoft/moonreaderp/PrefSelectHighlight;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->getContext()Landroid/content/Context;

    move-result-object v5

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->res:Landroid/content/Context;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->underline:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    sget v8, Lcom/flyersoft/tools/A;->underline_color:I

    new-instance v9, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$6;

    invoke-direct {v9, p0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$6;-><init>(Lcom/flyersoft/moonreaderp/PrefSelectHighlight;)V

    const/4 v7, 0x1

    invoke-direct/range {v4 .. v9}, Lcom/flyersoft/moonreaderp/PrefColorPick;-><init>(Landroid/content/Context;Ljava/lang/String;ZILcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;)V

    .line 231
    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/PrefColorPick;->show()V

    .line 233
    :cond_12
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->color3:Landroid/view/View;

    if-ne p1, v0, :cond_13

    .line 234
    new-instance v4, Lcom/flyersoft/moonreaderp/PrefColorPick;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->selfPref:Lcom/flyersoft/moonreaderp/PrefSelectHighlight;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->getContext()Landroid/content/Context;

    move-result-object v5

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->res:Landroid/content/Context;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->strikethrough:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    sget v8, Lcom/flyersoft/tools/A;->strikethrough_color:I

    new-instance v9, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$7;

    invoke-direct {v9, p0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$7;-><init>(Lcom/flyersoft/moonreaderp/PrefSelectHighlight;)V

    const/4 v7, 0x1

    invoke-direct/range {v4 .. v9}, Lcom/flyersoft/moonreaderp/PrefColorPick;-><init>(Landroid/content/Context;Ljava/lang/String;ZILcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;)V

    .line 241
    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/PrefColorPick;->show()V

    .line 243
    :cond_13
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->color4:Landroid/view/View;

    if-ne p1, v0, :cond_14

    .line 244
    new-instance v4, Lcom/flyersoft/moonreaderp/PrefColorPick;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->selfPref:Lcom/flyersoft/moonreaderp/PrefSelectHighlight;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->getContext()Landroid/content/Context;

    move-result-object v5

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->res:Landroid/content/Context;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->squiggly_underline:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    sget v8, Lcom/flyersoft/tools/A;->squiggly_color:I

    new-instance v9, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$8;

    invoke-direct {v9, p0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$8;-><init>(Lcom/flyersoft/moonreaderp/PrefSelectHighlight;)V

    const/4 v7, 0x1

    invoke-direct/range {v4 .. v9}, Lcom/flyersoft/moonreaderp/PrefColorPick;-><init>(Landroid/content/Context;Ljava/lang/String;ZILcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;)V

    .line 251
    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/PrefColorPick;->show()V

    .line 254
    :cond_14
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->hView2:Landroid/view/View;

    if-eq p1, v0, :cond_15

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->hView3:Landroid/view/View;

    if-eq p1, v0, :cond_15

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->hView4:Landroid/view/View;

    if-ne p1, v0, :cond_22

    .line 255
    :cond_15
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb1:Landroid/widget/RadioButton;

    invoke-virtual {v0}, Landroid/widget/RadioButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_17

    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->isPdf:Z

    if-eqz v0, :cond_16

    sget v0, Lcom/flyersoft/tools/A;->pdf_select_color:I

    goto :goto_5

    :cond_16
    sget v0, Lcom/flyersoft/tools/A;->highlight_color:I

    goto :goto_5

    .line 256
    :cond_17
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb2:Landroid/widget/RadioButton;

    invoke-virtual {v0}, Landroid/widget/RadioButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_18

    sget v0, Lcom/flyersoft/tools/A;->underline_color:I

    goto :goto_5

    :cond_18
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb3:Landroid/widget/RadioButton;

    invoke-virtual {v0}, Landroid/widget/RadioButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_19

    sget v0, Lcom/flyersoft/tools/A;->strikethrough_color:I

    goto :goto_5

    :cond_19
    sget v0, Lcom/flyersoft/tools/A;->squiggly_color:I

    .line 257
    :goto_5
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->hView2:Landroid/view/View;

    if-ne p1, v1, :cond_1a

    sget v1, Lcom/flyersoft/tools/A;->highlight_color1:I

    goto :goto_6

    :cond_1a
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->hView3:Landroid/view/View;

    if-ne p1, v1, :cond_1b

    sget v1, Lcom/flyersoft/tools/A;->highlight_color2:I

    goto :goto_6

    :cond_1b
    sget v1, Lcom/flyersoft/tools/A;->highlight_color3:I

    .line 259
    :goto_6
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 260
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->hView2:Landroid/view/View;

    if-ne p1, v2, :cond_1c

    .line 261
    sput v0, Lcom/flyersoft/tools/A;->highlight_color1:I

    goto :goto_7

    .line 262
    :cond_1c
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->hView3:Landroid/view/View;

    if-ne p1, v2, :cond_1d

    .line 263
    sput v0, Lcom/flyersoft/tools/A;->highlight_color2:I

    goto :goto_7

    .line 265
    :cond_1d
    sput v0, Lcom/flyersoft/tools/A;->highlight_color3:I

    .line 267
    :goto_7
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb1:Landroid/widget/RadioButton;

    invoke-virtual {v0}, Landroid/widget/RadioButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 268
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->isPdf:Z

    if-eqz v0, :cond_1e

    .line 269
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v1, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setPdfHighlightColor(IZ)V

    goto :goto_8

    .line 271
    :cond_1e
    sput v1, Lcom/flyersoft/tools/A;->highlight_color:I

    .line 272
    :goto_8
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->color1:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_9

    .line 273
    :cond_1f
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb2:Landroid/widget/RadioButton;

    invoke-virtual {v0}, Landroid/widget/RadioButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_20

    .line 274
    sput v1, Lcom/flyersoft/tools/A;->underline_color:I

    .line 275
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->color2:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_9

    .line 276
    :cond_20
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb3:Landroid/widget/RadioButton;

    invoke-virtual {v0}, Landroid/widget/RadioButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_21

    .line 277
    sput v1, Lcom/flyersoft/tools/A;->strikethrough_color:I

    .line 278
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->color3:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_9

    .line 279
    :cond_21
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb4:Landroid/widget/RadioButton;

    invoke-virtual {v0}, Landroid/widget/RadioButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_22

    .line 280
    sput v1, Lcom/flyersoft/tools/A;->squiggly_color:I

    .line 281
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->color4:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 285
    :cond_22
    :goto_9
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb1:Landroid/widget/RadioButton;

    if-ne p1, v0, :cond_23

    .line 286
    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->setChecked(Landroid/widget/RadioButton;)V

    .line 288
    :cond_23
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb2:Landroid/widget/RadioButton;

    if-ne p1, v0, :cond_24

    .line 289
    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->setChecked(Landroid/widget/RadioButton;)V

    .line 291
    :cond_24
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb3:Landroid/widget/RadioButton;

    if-ne p1, v0, :cond_25

    .line 292
    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->setChecked(Landroid/widget/RadioButton;)V

    .line 294
    :cond_25
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb4:Landroid/widget/RadioButton;

    if-ne p1, v0, :cond_26

    .line 295
    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->setChecked(Landroid/widget/RadioButton;)V

    :cond_26
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 45
    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->onCreate(Landroid/os/Bundle;)V

    .line 46
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->initView()V

    .line 47
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->initParams()Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const v0, 0x3f4ccccd    # 0.8f

    .line 48
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDim(F)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, -0x2

    .line 49
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHeight(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, 0x1

    .line 50
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFullscreen(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 51
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHideExit(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->res:Landroid/content/Context;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->highlight:I

    .line 52
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDialogTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 53
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->done()V

    return-void
.end method

.method protected setChecked(Landroid/widget/RadioButton;)V
    .locals 2

    .line 300
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb1:Landroid/widget/RadioButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 301
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb2:Landroid/widget/RadioButton;

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 302
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb3:Landroid/widget/RadioButton;

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 303
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->cb4:Landroid/widget/RadioButton;

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    const/4 v0, 0x1

    .line 304
    invoke-virtual {p1, v0}, Landroid/widget/RadioButton;->setChecked(Z)V

    return-void
.end method
