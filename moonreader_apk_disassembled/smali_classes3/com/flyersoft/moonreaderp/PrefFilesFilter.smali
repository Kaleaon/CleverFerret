.class public Lcom/flyersoft/moonreaderp/PrefFilesFilter;
.super Landroid/app/Dialog;
.source "PrefFilesFilter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field public static selfPref:Lcom/flyersoft/moonreaderp/PrefFilesFilter;


# instance fields
.field closeIv:Landroid/widget/ImageView;

.field onSortChanged:Landroid/widget/CompoundButton$OnCheckedChangeListener;

.field optionIv:Landroid/widget/ImageView;

.field rb11:Landroid/widget/RadioButton;

.field rb12:Landroid/widget/RadioButton;

.field rb21:Landroid/widget/RadioButton;

.field rb22:Landroid/widget/RadioButton;

.field rb31:Landroid/widget/RadioButton;

.field rb32:Landroid/widget/RadioButton;

.field res:Landroid/content/Context;

.field public root:Landroid/view/View;

.field sortRG:Landroid/widget/RadioGroup;

.field styleGroup:Lcom/google/android/material/button/MaterialButtonToggleGroup;


# direct methods
.method static bridge synthetic -$$Nest$msetSortChecked(Lcom/flyersoft/moonreaderp/PrefFilesFilter;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->setSortChecked()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 25
    invoke-static {}, Lcom/flyersoft/tools/A;->getAlertDialogTheme()I

    move-result v0

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 122
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefFilesFilter$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefFilesFilter$2;-><init>(Lcom/flyersoft/moonreaderp/PrefFilesFilter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->onSortChanged:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 26
    sput-object p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->selfPref:Lcom/flyersoft/moonreaderp/PrefFilesFilter;

    .line 27
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->res:Landroid/content/Context;

    .line 28
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->files_filter:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->root:Landroid/view/View;

    .line 29
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method private getSortName(Ljava/lang/String;Z)Ljava/lang/CharSequence;
    .locals 2

    .line 116
    const-string v0, "("

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_0

    const/4 v1, 0x0

    .line 118
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 119
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "<b>"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz p2, :cond_1

    const-string p2, "\u2193"

    goto :goto_0

    :cond_1
    const-string p2, "\u2191"

    :goto_0
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "</b>"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    return-object p1
.end method

.method private setSortChecked()V
    .locals 8

    .line 135
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb11:Landroid/widget/RadioButton;

    sget v1, Lcom/flyersoft/tools/A;->files_sort_by:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 136
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb21:Landroid/widget/RadioButton;

    sget v1, Lcom/flyersoft/tools/A;->files_sort_by:I

    if-ne v1, v3, :cond_1

    const/4 v1, 0x1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 137
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb31:Landroid/widget/RadioButton;

    sget v1, Lcom/flyersoft/tools/A;->files_sort_by:I

    const/4 v4, 0x2

    if-ne v1, v4, :cond_2

    const/4 v1, 0x1

    goto :goto_2

    :cond_2
    const/4 v1, 0x0

    :goto_2
    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 138
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb12:Landroid/widget/RadioButton;

    sget v1, Lcom/flyersoft/tools/A;->files_sort_by:I

    const/4 v5, 0x3

    if-ne v1, v5, :cond_3

    const/4 v1, 0x1

    goto :goto_3

    :cond_3
    const/4 v1, 0x0

    :goto_3
    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 139
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb22:Landroid/widget/RadioButton;

    sget v1, Lcom/flyersoft/tools/A;->files_sort_by:I

    const/4 v6, 0x4

    if-ne v1, v6, :cond_4

    const/4 v1, 0x1

    goto :goto_4

    :cond_4
    const/4 v1, 0x0

    :goto_4
    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 140
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb32:Landroid/widget/RadioButton;

    sget v1, Lcom/flyersoft/tools/A;->files_sort_by:I

    const/4 v7, 0x5

    if-ne v1, v7, :cond_5

    const/4 v1, 0x1

    goto :goto_5

    :cond_5
    const/4 v1, 0x0

    :goto_5
    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 141
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb11:Landroid/widget/RadioButton;

    invoke-virtual {v0}, Landroid/widget/RadioButton;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/A;->files_sort_by:I

    if-nez v1, :cond_6

    const/4 v1, 0x1

    goto :goto_6

    :cond_6
    const/4 v1, 0x0

    :goto_6
    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 142
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb21:Landroid/widget/RadioButton;

    invoke-virtual {v0}, Landroid/widget/RadioButton;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/A;->files_sort_by:I

    if-ne v1, v3, :cond_7

    const/4 v1, 0x1

    goto :goto_7

    :cond_7
    const/4 v1, 0x0

    :goto_7
    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 143
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb31:Landroid/widget/RadioButton;

    invoke-virtual {v0}, Landroid/widget/RadioButton;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/A;->files_sort_by:I

    if-ne v1, v4, :cond_8

    const/4 v1, 0x1

    goto :goto_8

    :cond_8
    const/4 v1, 0x0

    :goto_8
    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 144
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb12:Landroid/widget/RadioButton;

    invoke-virtual {v0}, Landroid/widget/RadioButton;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/A;->files_sort_by:I

    if-ne v1, v5, :cond_9

    const/4 v1, 0x1

    goto :goto_9

    :cond_9
    const/4 v1, 0x0

    :goto_9
    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 145
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb22:Landroid/widget/RadioButton;

    invoke-virtual {v0}, Landroid/widget/RadioButton;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/A;->files_sort_by:I

    if-ne v1, v6, :cond_a

    const/4 v1, 0x1

    goto :goto_a

    :cond_a
    const/4 v1, 0x0

    :goto_a
    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 146
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb32:Landroid/widget/RadioButton;

    invoke-virtual {v0}, Landroid/widget/RadioButton;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/A;->files_sort_by:I

    if-ne v1, v7, :cond_b

    const/4 v2, 0x1

    :cond_b
    invoke-virtual {v0, v2}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .line 151
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    const/4 v0, 0x0

    .line 152
    sput-object v0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->selfPref:Lcom/flyersoft/moonreaderp/PrefFilesFilter;

    return-void
.end method

.method public initView()V
    .locals 6

    .line 56
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->closeIv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->closeIv:Landroid/widget/ImageView;

    .line 57
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->optionIv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->optionIv:Landroid/widget/ImageView;

    .line 58
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->radioGroup2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioGroup;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->sortRG:Landroid/widget/RadioGroup;

    .line 60
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->radio11:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb11:Landroid/widget/RadioButton;

    .line 61
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->radio21:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb21:Landroid/widget/RadioButton;

    .line 62
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->radio31:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb31:Landroid/widget/RadioButton;

    .line 63
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->radio12:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb12:Landroid/widget/RadioButton;

    .line 64
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->radio22:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb22:Landroid/widget/RadioButton;

    .line 65
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->radio32:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb32:Landroid/widget/RadioButton;

    .line 67
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb11:Landroid/widget/RadioButton;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$array;->sort_by:I

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, v3}, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->getSortName(Ljava/lang/String;Z)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 68
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb21:Landroid/widget/RadioButton;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$array;->sort_by:I

    const/4 v4, 0x1

    invoke-static {v1, v2, v4}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, v3}, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->getSortName(Ljava/lang/String;Z)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 69
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb31:Landroid/widget/RadioButton;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$array;->sort_by:I

    const/4 v5, 0x2

    invoke-static {v1, v2, v5}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, v3}, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->getSortName(Ljava/lang/String;Z)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 70
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb12:Landroid/widget/RadioButton;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$array;->sort_by:I

    const/4 v3, 0x3

    invoke-static {v1, v2, v3}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, v4}, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->getSortName(Ljava/lang/String;Z)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 71
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb22:Landroid/widget/RadioButton;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$array;->sort_by:I

    const/4 v3, 0x4

    invoke-static {v1, v2, v3}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, v4}, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->getSortName(Ljava/lang/String;Z)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 72
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb32:Landroid/widget/RadioButton;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$array;->sort_by:I

    const/4 v5, 0x5

    invoke-static {v1, v2, v5}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, v4}, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->getSortName(Ljava/lang/String;Z)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 86
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->setSortChecked()V

    .line 87
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb11:Landroid/widget/RadioButton;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->onSortChanged:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 88
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb21:Landroid/widget/RadioButton;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->onSortChanged:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 89
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb31:Landroid/widget/RadioButton;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->onSortChanged:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 90
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb12:Landroid/widget/RadioButton;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->onSortChanged:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 91
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb22:Landroid/widget/RadioButton;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->onSortChanged:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 92
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->rb32:Landroid/widget/RadioButton;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->onSortChanged:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 94
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->closeIv:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 95
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->optionIv:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 96
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->optionIv:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 98
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->shelfStyleGroup:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/button/MaterialButtonToggleGroup;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->styleGroup:Lcom/google/android/material/button/MaterialButtonToggleGroup;

    .line 99
    invoke-static {v0}, Lcom/flyersoft/tools/C;->setToggleButtonColorState(Landroid/view/View;)V

    .line 101
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->styleGroup:Lcom/google/android/material/button/MaterialButtonToggleGroup;

    sget-boolean v1, Lcom/flyersoft/tools/A;->fileUseGrid:Z

    if-nez v1, :cond_0

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->style0:I

    goto :goto_0

    :cond_0
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->style1:I

    :goto_0
    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->check(I)V

    .line 102
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->styleGroup:Lcom/google/android/material/button/MaterialButtonToggleGroup;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefFilesFilter$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefFilesFilter$1;-><init>(Lcom/flyersoft/moonreaderp/PrefFilesFilter;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->addOnButtonCheckedListener(Lcom/google/android/material/button/MaterialButtonToggleGroup$OnButtonCheckedListener;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 156
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->closeIv:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_0

    .line 157
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->cancel()V

    .line 160
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->optionIv:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_1

    .line 161
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 162
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->showOptionsWindow(Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 34
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 35
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    .line 36
    invoke-static {}, Lcom/flyersoft/tools/A;->getScreenWidth()I

    move-result v0

    .line 37
    invoke-static {}, Lcom/flyersoft/tools/A;->getScreenHeight()I

    move-result v1

    if-le v0, v1, :cond_0

    move v0, v1

    .line 40
    :cond_0
    sget-boolean v1, Lcom/flyersoft/tools/A;->isLargeTablet:Z

    if-eqz v1, :cond_1

    const/16 v1, 0x3c

    goto :goto_0

    :cond_1
    const/16 v1, 0x50

    :goto_0
    mul-int v1, v1, v0

    div-int/lit8 v1, v1, 0x64

    .line 41
    sget-boolean v2, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v2, :cond_2

    move v0, v1

    :cond_2
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 42
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 44
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->initView()V

    .line 45
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->root:Landroid/view/View;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    .line 46
    sget-boolean p1, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz p1, :cond_3

    .line 47
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-static {}, Lcom/flyersoft/tools/C;->dialogColor()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_3
    return-void
.end method
