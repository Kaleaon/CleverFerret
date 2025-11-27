.class public Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;
.super Lcom/flyersoft/moonreaderp/PrefOptions;
.source "PrefSelectImportBooks.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$OnFinish;,
        Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;
    }
.end annotation


# instance fields
.field allB:Landroid/widget/TextView;

.field cancelB:Landroid/widget/TextView;

.field doFinish:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$OnFinish;

.field fileList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

.field folderB:Landroid/widget/TextView;

.field ignoreSameCb:Landroid/widget/CheckBox;

.field items:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;",
            ">;"
        }
    .end annotation
.end field

.field key:Ljava/lang/String;

.field nameB:Landroid/widget/TextView;

.field noneB:Landroid/widget/TextView;

.field okB:Landroid/widget/TextView;

.field operation:I

.field optionB:Landroid/view/View;

.field sortBy:I

.field timeB:Landroid/widget/TextView;

.field type:I

.field usedItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$msetButtonText(Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->setButtonText()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$OnFinish;I)V
    .locals 1

    .line 45
    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->import_files_select:I

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;-><init>(Landroid/content/Context;I)V

    const/4 p1, 0x1

    .line 164
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->sortBy:I

    .line 46
    iput p3, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->type:I

    .line 47
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->doFinish:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$OnFinish;

    .line 48
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->import_items:Ljava/util/ArrayList;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->usedItems:Ljava/util/ArrayList;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->items:Ljava/util/ArrayList;

    return-void
.end method

.method private boldText(Ljava/lang/String;Z)Ljava/lang/CharSequence;
    .locals 1

    if-eqz p2, :cond_0

    .line 181
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "<b>"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "</b>"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    :cond_0
    return-object p1
.end method

.method private createFileList(Z)V
    .locals 5

    .line 190
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->fileList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 191
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->fileList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->getContext()Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x1

    invoke-direct {v2, v3, v4, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 192
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->fileList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$BookFileAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;)V

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    if-eqz p1, :cond_2

    .line 194
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->usedItems:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ge v1, p1, :cond_2

    .line 195
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->usedItems:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->selected:Z

    if-eqz p1, :cond_1

    .line 196
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->fileList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->myScrollTo(I)Z

    return-void

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method private initView()V
    .locals 4

    .line 118
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->bytime:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->timeB:Landroid/widget/TextView;

    .line 119
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->bystorage:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->folderB:Landroid/widget/TextView;

    .line 120
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->byfilename:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->nameB:Landroid/widget/TextView;

    .line 121
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->all:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->allB:Landroid/widget/TextView;

    .line 122
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->none:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->noneB:Landroid/widget/TextView;

    .line 123
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->optionB:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->optionB:Landroid/view/View;

    .line 124
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->okB:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->okB:Landroid/widget/TextView;

    .line 125
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cancelB:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->cancelB:Landroid/widget/TextView;

    .line 126
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->listSv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->fileList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    .line 127
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v0

    if-nez v0, :cond_0

    .line 128
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->fileList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    const v1, -0x777778

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->smallThumbColor:Ljava/lang/Integer;

    .line 130
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->phExit:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 131
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->timeB:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 132
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->folderB:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 133
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->nameB:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 134
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->allB:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 135
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->noneB:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 136
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->optionB:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 137
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->okB:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 138
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->cancelB:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 140
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->type:I

    const/4 v1, 0x1

    if-nez v0, :cond_1

    .line 141
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->setButtonText()V

    .line 142
    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->createFileList(Z)V

    goto :goto_0

    .line 144
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->toolbarLight:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 145
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->footerSubLight:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 146
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->type:I

    if-ne v0, v1, :cond_2

    .line 147
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->timeB:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->performClick()Z

    goto :goto_0

    :cond_2
    const/4 v1, 0x2

    if-ne v0, v1, :cond_3

    .line 149
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->folderB:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->performClick()Z

    goto :goto_0

    .line 151
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->nameB:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->performClick()Z

    .line 154
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ignoreSameCb:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->ignoreSameCb:Landroid/widget/CheckBox;

    .line 155
    sget-boolean v1, Lcom/flyersoft/tools/A;->importIgnoreSame:Z

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 156
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->ignoreSameCb:Landroid/widget/CheckBox;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$4;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$4;-><init>(Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;)V

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    return-void
.end method

.method private selectAll(Z)V
    .locals 2

    .line 185
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->usedItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;

    .line 186
    iput-boolean p1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->selected:Z

    goto :goto_0

    :cond_0
    return-void
.end method

.method private setButtonText()V
    .locals 6

    .line 168
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->usedItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;

    .line 169
    iget-boolean v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->selected:Z

    if-eqz v3, :cond_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 171
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->okB:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->import_ebooks:I

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 172
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->timeB:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->sort_by_time:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->sortBy:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_2

    const/4 v3, 0x1

    goto :goto_1

    :cond_2
    const/4 v3, 0x0

    :goto_1
    invoke-direct {p0, v2, v3}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->boldText(Ljava/lang/String;Z)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 173
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->folderB:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->location:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->sortBy:I

    const/4 v5, 0x2

    if-ne v3, v5, :cond_3

    const/4 v3, 0x1

    goto :goto_2

    :cond_3
    const/4 v3, 0x0

    :goto_2
    invoke-direct {p0, v2, v3}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->boldText(Ljava/lang/String;Z)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 174
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->nameB:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->filename:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->sortBy:I

    const/4 v5, 0x3

    if-ne v3, v5, :cond_4

    const/4 v1, 0x1

    :cond_4
    invoke-direct {p0, v2, v1}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->boldText(Ljava/lang/String;Z)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 176
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 2

    .line 393
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->dismiss()V

    .line 394
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->doFinish:Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$OnFinish;

    if-eqz v0, :cond_0

    .line 395
    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->operation:I

    invoke-interface {v0, v1}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$OnFinish;->onFinish(I)V

    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 346
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->phExit:Landroid/view/View;

    const/4 v1, 0x0

    if-ne p1, v0, :cond_0

    .line 347
    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->selectAll(Z)V

    .line 348
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->cancel()V

    .line 350
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->timeB:Landroid/widget/TextView;

    const/4 v2, 0x1

    if-ne p1, v0, :cond_1

    .line 351
    iput v2, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->sortBy:I

    .line 352
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->usedItems:Ljava/util/ArrayList;

    iget v4, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->sortBy:I

    invoke-virtual {v0, v3, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->sortImportItems(Ljava/util/ArrayList;I)V

    .line 353
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->setButtonText()V

    .line 354
    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->createFileList(Z)V

    .line 356
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->folderB:Landroid/widget/TextView;

    const/4 v3, 0x2

    if-ne p1, v0, :cond_2

    .line 357
    iput v3, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->sortBy:I

    .line 358
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->usedItems:Ljava/util/ArrayList;

    iget v5, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->sortBy:I

    invoke-virtual {v0, v4, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->sortImportItems(Ljava/util/ArrayList;I)V

    .line 359
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->setButtonText()V

    .line 360
    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->createFileList(Z)V

    .line 362
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->nameB:Landroid/widget/TextView;

    if-ne p1, v0, :cond_3

    const/4 v0, 0x3

    .line 363
    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->sortBy:I

    .line 364
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->usedItems:Ljava/util/ArrayList;

    iget v5, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->sortBy:I

    invoke-virtual {v0, v4, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->sortImportItems(Ljava/util/ArrayList;I)V

    .line 365
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->setButtonText()V

    .line 366
    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->createFileList(Z)V

    .line 368
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->allB:Landroid/widget/TextView;

    if-ne p1, v0, :cond_4

    .line 369
    invoke-direct {p0, v2}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->selectAll(Z)V

    .line 370
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->setButtonText()V

    .line 371
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->fileList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 373
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->noneB:Landroid/widget/TextView;

    if-ne p1, v0, :cond_5

    .line 374
    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->selectAll(Z)V

    .line 375
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->setButtonText()V

    .line 376
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->fileList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 378
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->optionB:Landroid/view/View;

    if-ne p1, v0, :cond_6

    .line 379
    iput v2, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->operation:I

    .line 380
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->dismiss()V

    .line 382
    :cond_6
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->okB:Landroid/widget/TextView;

    if-ne p1, v0, :cond_7

    .line 383
    iput v3, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->operation:I

    .line 384
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->dismiss()V

    .line 386
    :cond_7
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->cancelB:Landroid/widget/TextView;

    if-ne p1, v0, :cond_8

    .line 387
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->dismiss()V

    :cond_8
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 53
    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->onCreate(Landroid/os/Bundle;)V

    .line 55
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->usedItems:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 56
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->dismiss()V

    return-void

    .line 60
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->initView()V

    .line 61
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->initParams()Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/high16 v0, 0x3f800000    # 1.0f

    .line 62
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDim(F)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, -0x1

    .line 63
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHeight(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, 0x1

    .line 64
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFullscreen(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 66
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->type:I

    if-nez v1, :cond_1

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->import_ebooks2:I

    goto :goto_0

    :cond_1
    sget v1, Lcom/flyersoft/moonreaderp/R$string;->book_found:I

    :goto_0
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->deleteQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDialogTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, 0x0

    .line 67
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFuncSearchVisible(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 68
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->done()V

    .line 70
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->searchView:Landroidx/appcompat/widget/SearchView;

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$1;-><init>(Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;)V

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Landroidx/appcompat/widget/SearchView$OnQueryTextListener;)V

    .line 81
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->searchView:Landroidx/appcompat/widget/SearchView;

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$2;-><init>(Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;)V

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setOnCloseListener(Landroidx/appcompat/widget/SearchView$OnCloseListener;)V

    .line 89
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->searchView:Landroidx/appcompat/widget/SearchView;

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$3;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$3;-><init>(Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;)V

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setOnSearchClickListener(Landroid/view/View$OnClickListener;)V

    .line 97
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->searchView:Landroidx/appcompat/widget/SearchView;

    const v0, -0x333334

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->setImageViewTint(Landroid/view/View;I)V

    .line 98
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->searchAutoComplete:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;->setTextColor(I)V

    .line 99
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->searchAutoComplete:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    const-string v0, ""

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;->setHint(Ljava/lang/CharSequence;)V

    return-void
.end method

.method searchFont(Ljava/lang/String;)V
    .locals 4

    .line 104
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->key:Ljava/lang/String;

    .line 105
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p1

    .line 106
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->usedItems:Ljava/util/ArrayList;

    .line 107
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;

    if-nez p1, :cond_1

    .line 108
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->filename:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 109
    :cond_1
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->usedItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 110
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->fileList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 111
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectImportBooks;->fileList:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    :cond_3
    return-void
.end method
