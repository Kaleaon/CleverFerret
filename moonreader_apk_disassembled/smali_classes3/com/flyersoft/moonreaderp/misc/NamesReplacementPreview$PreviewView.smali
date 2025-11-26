.class Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;
.super Ljava/lang/Object;
.source "NamesReplacementPreview.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PreviewView"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView$MainPagerAdapter;
    }
.end annotation


# instance fields
.field context:Landroid/content/Context;

.field htmlAfter:Ljava/lang/String;

.field htmlBefore:Ljava/lang/String;

.field replaceLay:Landroid/widget/LinearLayout;

.field root:Landroid/view/View;


# direct methods
.method static bridge synthetic -$$Nest$mcreate_html_after(Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;)Landroid/view/View;
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->create_html_after()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mcreate_html_before(Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;)Landroid/view/View;
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->create_html_before()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mcreate_original(Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;)Landroid/view/View;
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->create_original()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mcreate_preview(Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;)Landroid/view/View;
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->create_preview()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/widget/LinearLayout;)V
    .locals 4

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->context:Landroid/content/Context;

    .line 47
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->replaceLay:Landroid/widget/LinearLayout;

    .line 48
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->names_replacement_preview:I

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->root:Landroid/view/View;

    .line 49
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->view_pager_main:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/views/MyViewPager;

    .line 50
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->tab:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/google/android/material/tabs/TabLayout;

    .line 52
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefChapters;->getTabLayoutBackColor()I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/google/android/material/tabs/TabLayout;->setBackgroundColor(I)V

    .line 53
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefChapters;->getToolbarUnSelectedTextColor()I

    move-result v0

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefChapters;->getToolbarSelectedTextColor()I

    move-result v1

    invoke-virtual {p2, v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setTabTextColors(II)V

    .line 54
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->root:Landroid/view/View;

    new-instance v1, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView$1;

    invoke-direct {v1, p0, p2}, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView$1;-><init>(Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;Lcom/google/android/material/tabs/TabLayout;)V

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 62
    invoke-virtual {p2, p1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 63
    new-instance p2, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView$MainPagerAdapter;

    invoke-direct {p2, p0}, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView$MainPagerAdapter;-><init>(Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;)V

    invoke-virtual {p1, p2}, Lcom/flyersoft/views/MyViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    .line 64
    new-instance p2, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView$2;

    invoke-direct {p2, p0}, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView$2;-><init>(Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;)V

    invoke-virtual {p1, p2}, Lcom/flyersoft/views/MyViewPager;->addOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;)V

    .line 74
    sget p2, Lcom/flyersoft/tools/A;->namesReplacePriewTab:I

    invoke-virtual {p1, p2}, Lcom/flyersoft/views/MyViewPager;->setCurrentItem(I)V

    return-void
.end method

.method private create_html_after()Landroid/view/View;
    .locals 5

    .line 134
    new-instance v0, Landroid/widget/ScrollView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/high16 v1, 0x41000000    # 8.0f

    .line 135
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-virtual {v0, v2, v3, v4, v1}, Landroid/widget/ScrollView;->setPadding(IIII)V

    const/4 v1, 0x0

    .line 136
    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V

    .line 137
    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 138
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->getHtmlAfter()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, 0x1

    .line 139
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextIsSelectable(Z)V

    const/4 v2, -0x1

    .line 140
    invoke-virtual {v0, v1, v2, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;II)V

    .line 141
    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    return-object v0
.end method

.method private create_html_before()Landroid/view/View;
    .locals 5

    .line 122
    new-instance v0, Landroid/widget/ScrollView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/high16 v1, 0x41000000    # 8.0f

    .line 123
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-virtual {v0, v2, v3, v4, v1}, Landroid/widget/ScrollView;->setPadding(IIII)V

    const/4 v1, 0x0

    .line 124
    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V

    .line 125
    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 126
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->getOriginalHtml()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, 0x1

    .line 127
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextIsSelectable(Z)V

    const/4 v2, -0x1

    .line 128
    invoke-virtual {v0, v1, v2, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;II)V

    .line 129
    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    return-object v0
.end method

.method private create_original()Landroid/view/View;
    .locals 5

    .line 175
    new-instance v0, Landroid/widget/ScrollView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/high16 v1, 0x41000000    # 8.0f

    .line 176
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-virtual {v0, v2, v3, v4, v1}, Landroid/widget/ScrollView;->setPadding(IIII)V

    const/4 v1, 0x0

    .line 177
    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V

    .line 178
    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 179
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->getOriginalHtml()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, 0x1

    .line 180
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextIsSelectable(Z)V

    const/4 v2, -0x1

    .line 181
    invoke-virtual {v0, v1, v2, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;II)V

    .line 182
    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    return-object v0
.end method

.method private create_preview()Landroid/view/View;
    .locals 5

    .line 163
    new-instance v0, Landroid/widget/ScrollView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/high16 v1, 0x41000000    # 8.0f

    .line 164
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-virtual {v0, v2, v3, v4, v1}, Landroid/widget/ScrollView;->setPadding(IIII)V

    const/4 v1, 0x0

    .line 165
    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V

    .line 166
    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 167
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->getHtmlAfter()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, 0x1

    .line 168
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextIsSelectable(Z)V

    const/4 v2, -0x1

    .line 169
    invoke-virtual {v0, v1, v2, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;II)V

    .line 170
    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    return-object v0
.end method

.method private getHtmlAfter()Ljava/lang/String;
    .locals 6

    .line 204
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->htmlAfter:Ljava/lang/String;

    if-nez v0, :cond_4

    .line 205
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->getOriginalHtml()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 206
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->replaceLay:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    if-ge v1, v2, :cond_3

    .line 207
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->replaceLay:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 208
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->editText1:I

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 209
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->editText2:I

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 210
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2

    .line 212
    :try_start_0
    const-string v5, "*"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-le v5, v3, :cond_0

    .line 213
    invoke-virtual {v4, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 214
    :cond_0
    sget-boolean v3, Lcom/flyersoft/tools/A;->names_replace_with_regular_expression:Z

    if-eqz v3, :cond_1

    .line 215
    invoke-virtual {v0, v4, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 217
    :cond_1
    invoke-virtual {v0, v4, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v2

    .line 219
    invoke-static {v2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 220
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->context:Landroid/content/Context;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 223
    :cond_3
    iput-object v0, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->htmlAfter:Ljava/lang/String;

    .line 225
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->htmlAfter:Ljava/lang/String;

    return-object v0
.end method

.method private getOriginalHtml()Ljava/lang/String;
    .locals 2

    .line 188
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->htmlBefore:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 189
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    sget v1, Lcom/flyersoft/tools/A;->lastChapter:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/books/BaseEBook;->getChapterText(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->htmlBefore:Ljava/lang/String;

    .line 191
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 192
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->htmlBefore:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/flyersoft/tools/A;->adjustChapterHtml(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;

    .line 193
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 194
    sget v1, Lcom/flyersoft/tools/A;->lastSplitIndex:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->htmlBefore:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 196
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 199
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;->htmlBefore:Ljava/lang/String;

    return-object v0
.end method
