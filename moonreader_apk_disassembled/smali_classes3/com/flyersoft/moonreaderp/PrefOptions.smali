.class public Lcom/flyersoft/moonreaderp/PrefOptions;
.super Landroid/app/Dialog;
.source "PrefOptions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefOptions$ActionBarSearchAdapter;
    }
.end annotation


# static fields
.field public static dialogs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/moonreaderp/PrefOptions;",
            ">;"
        }
    .end annotation
.end field

.field private static headerScrollEvent:Landroid/view/View$OnClickListener;


# instance fields
.field dim:F

.field public forFuncSearch:Z

.field fullscreen:Z

.field private funcSearchResults:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/moonreaderp/misc/FuncSearch$FuncSearchResult;",
            ">;"
        }
    .end annotation
.end field

.field gravity:I

.field height:I

.field hideExit:Z

.field public phExit:Landroid/view/View;

.field public phTitle:Landroid/widget/TextView;

.field public res:Landroid/content/Context;

.field public root:Landroid/view/View;

.field searchAutoComplete:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

.field public searchView:Landroidx/appcompat/widget/SearchView;

.field statusBarColor:I

.field public title:Ljava/lang/CharSequence;

.field width:I


# direct methods
.method static bridge synthetic -$$Nest$fgetfuncSearchResults(Lcom/flyersoft/moonreaderp/PrefOptions;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->funcSearchResults:Ljava/util/ArrayList;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mshowSearchSuggestions(Lcom/flyersoft/moonreaderp/PrefOptions;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->showSearchSuggestions(Ljava/lang/String;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/flyersoft/moonreaderp/PrefOptions;->dialogs:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1

    .line 60
    sget-boolean v0, Lcom/flyersoft/tools/A;->eink:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/moonreaderp/R$style;->dialog_fullscreen_ink:I

    goto :goto_0

    :cond_0
    sget v0, Lcom/flyersoft/moonreaderp/R$style;->dialog_fullscreen:I

    :goto_0
    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    const/4 p1, 0x1

    .line 91
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->fullscreen:Z

    .line 61
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->getContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->res:Landroid/content/Context;

    .line 62
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->root:Landroid/view/View;

    .line 63
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->titleB:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->phTitle:Landroid/widget/TextView;

    .line 64
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->root:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->exitB:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->phExit:Landroid/view/View;

    .line 65
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->root:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->phSearch:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/SearchView;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->searchView:Landroidx/appcompat/widget/SearchView;

    if-eqz p1, :cond_1

    const/16 p2, 0x8

    .line 67
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/SearchView;->setVisibility(I)V

    .line 68
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->root:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    if-eqz p1, :cond_2

    const/4 p2, 0x0

    .line 70
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setVerticalScrollBarEnabled(Z)V

    .line 71
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->root:Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->setContentView(Landroid/view/View;)V

    .line 72
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefOptions;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static dismissAll()V
    .locals 2

    .line 39
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefOptions;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_1

    .line 40
    sget-object v1, Lcom/flyersoft/moonreaderp/PrefOptions;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 41
    sget-object v1, Lcom/flyersoft/moonreaderp/PrefOptions;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/moonreaderp/PrefOptions;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefOptions;->dismiss()V

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 43
    :cond_1
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefOptions;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public static getHeaderScrollEvent()Landroid/view/View$OnClickListener;
    .locals 1

    .line 188
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefOptions;->headerScrollEvent:Landroid/view/View$OnClickListener;

    if-nez v0, :cond_0

    .line 189
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefOptions$2;

    invoke-direct {v0}, Lcom/flyersoft/moonreaderp/PrefOptions$2;-><init>()V

    sput-object v0, Lcom/flyersoft/moonreaderp/PrefOptions;->headerScrollEvent:Landroid/view/View$OnClickListener;

    .line 226
    :cond_0
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefOptions;->headerScrollEvent:Landroid/view/View$OnClickListener;

    return-object v0
.end method

.method public static hideNavigation()V
    .locals 3

    .line 47
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefOptions;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/moonreaderp/PrefOptions;

    if-eqz v1, :cond_0

    .line 48
    iget-object v2, v1, Lcom/flyersoft/moonreaderp/PrefOptions;->root:Landroid/view/View;

    if-eqz v2, :cond_0

    .line 49
    iget-boolean v2, v1, Lcom/flyersoft/moonreaderp/PrefOptions;->fullscreen:Z

    if-eqz v2, :cond_0

    .line 50
    invoke-static {v1}, Lcom/flyersoft/tools/A;->forceDialogImmersiveMode(Landroid/app/Dialog;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method private setHeaderTapEvent()V
    .locals 2

    .line 183
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->root:Landroid/view/View;

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefOptions;->getHeaderScrollEvent()Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public static setImageViewTint(Landroid/view/View;I)V
    .locals 3

    .line 388
    instance-of v0, p0, Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    .line 389
    check-cast p0, Landroid/widget/ImageView;

    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p0, p1, v0}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    return-void

    .line 390
    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 391
    :goto_0
    move-object v1, p0

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 392
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->setImageViewTint(Landroid/view/View;I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private showSearchSuggestions(Ljava/lang/String;)V
    .locals 6

    .line 328
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/tools/A;->lastFuncKey:Ljava/lang/String;

    .line 329
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 330
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v2, :cond_0

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->getType(C)I

    move-result v0

    const/4 v4, 0x5

    if-eq v0, v4, :cond_0

    goto :goto_1

    .line 334
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 336
    invoke-static {p0, p1}, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->getSearchResults(Lcom/flyersoft/moonreaderp/PrefOptions;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->funcSearchResults:Ljava/util/ArrayList;

    .line 338
    new-instance v0, Landroid/database/MatrixCursor;

    const-string v4, "_id"

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    .line 339
    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v4, 0x0

    .line 340
    :goto_0
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->funcSearchResults:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v4, v5, :cond_1

    .line 341
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v3

    .line 342
    invoke-virtual {v0, v2}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 345
    :cond_1
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->funcSearchResults:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_2

    .line 346
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->searchView:Landroidx/appcompat/widget/SearchView;

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefOptions$ActionBarSearchAdapter;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, p0, v3, v0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions$ActionBarSearchAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefOptions;Landroid/content/Context;Landroid/database/Cursor;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/SearchView;->setSuggestionsAdapter(Landroidx/cursoradapter/widget/CursorAdapter;)V

    return-void

    .line 348
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->searchView:Landroidx/appcompat/widget/SearchView;

    invoke-virtual {p1, v1}, Landroidx/appcompat/widget/SearchView;->setSuggestionsAdapter(Landroidx/cursoradapter/widget/CursorAdapter;)V

    return-void

    .line 331
    :cond_3
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->searchView:Landroidx/appcompat/widget/SearchView;

    invoke-virtual {p1, v1}, Landroidx/appcompat/widget/SearchView;->setSuggestionsAdapter(Landroidx/cursoradapter/widget/CursorAdapter;)V

    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 5

    .line 231
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefOptions;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 232
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->forFuncSearch:Z

    if-eqz v0, :cond_0

    .line 233
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 236
    invoke-static {v0}, Lcom/flyersoft/tools/A;->setSystemUiVisibility(Z)V

    .line 237
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 238
    invoke-static {}, Lcom/flyersoft/components/MyDialog;->hideNavigation()V

    .line 239
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefOptions;->hideNavigation()V

    .line 241
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->funcSearchResults:Ljava/util/ArrayList;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 242
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->funcSearchResults:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 244
    :cond_1
    sget-object v1, Lcom/flyersoft/moonreaderp/PrefOptions;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x1

    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/moonreaderp/PrefOptions;

    .line 245
    iget-boolean v3, v3, Lcom/flyersoft/moonreaderp/PrefOptions;->forFuncSearch:Z

    if-nez v3, :cond_2

    const/4 v2, 0x0

    goto :goto_0

    :cond_3
    if-eqz v2, :cond_4

    .line 248
    invoke-static {}, Lcom/flyersoft/moonreaderp/misc/FuncSearch;->clearSearchFuncDialogs()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 249
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "*FuncSearch.clearSearchFuncDialogs()"

    aput-object v1, v0, v4

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    :cond_4
    return-void
.end method

.method public done()V
    .locals 3

    .line 145
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 146
    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->dim:F

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 147
    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->height:I

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 148
    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->width:I

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 149
    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->gravity:I

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 150
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 151
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 152
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 154
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->fullscreen:Z

    if-eqz v0, :cond_0

    .line 155
    invoke-static {p0}, Lcom/flyersoft/tools/A;->forceDialogImmersiveMode(Landroid/app/Dialog;)V

    .line 164
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->hideExit:Z

    if-eqz v0, :cond_2

    .line 165
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->phExit:Landroid/view/View;

    if-eqz v0, :cond_1

    const/16 v1, 0x8

    .line 166
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 167
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->phTitle:Landroid/widget/TextView;

    if-eqz v0, :cond_3

    const/high16 v1, 0x41a00000    # 20.0f

    .line 168
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v2, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    goto :goto_0

    .line 169
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->phExit:Landroid/view/View;

    if-eqz v0, :cond_3

    instance-of v0, v0, Landroid/widget/ImageView;

    if-eqz v0, :cond_3

    .line 170
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->headerMain:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 171
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->phExit:Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/C;->setIconPrimary(Landroid/widget/ImageView;Z)V

    .line 174
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->title:Ljava/lang/CharSequence;

    if-eqz v0, :cond_4

    .line 175
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->phTitle:Landroid/widget/TextView;

    if-eqz v1, :cond_4

    .line 176
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 179
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->root:Landroid/view/View;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    return-void
.end method

.method public initParams()Lcom/flyersoft/moonreaderp/PrefOptions;
    .locals 1

    const/4 v0, 0x0

    .line 96
    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->dim:F

    const/4 v0, -0x1

    .line 98
    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->height:I

    .line 99
    invoke-static {}, Lcom/flyersoft/tools/A;->myOptionDialogWidth()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->width:I

    const/16 v0, 0x31

    .line 100
    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->gravity:I

    return-object p0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 77
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 78
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHeaderTapEvent()V

    .line 79
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->phExit:Landroid/view/View;

    if-eqz p1, :cond_0

    .line 80
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefOptions$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefOptions$1;-><init>(Lcom/flyersoft/moonreaderp/PrefOptions;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    return-void
.end method

.method public scrollToTitle(Ljava/lang/String;)V
    .locals 4

    if-eqz p1, :cond_0

    .line 254
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->root:Landroid/view/View;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefOptions$3;

    invoke-direct {v1, p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions$3;-><init>(Lcom/flyersoft/moonreaderp/PrefOptions;Ljava/lang/String;)V

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method

.method public setDialogTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/moonreaderp/PrefOptions;
    .locals 0

    .line 140
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->title:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public setDim(F)Lcom/flyersoft/moonreaderp/PrefOptions;
    .locals 0

    .line 105
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->dim:F

    return-object p0
.end method

.method public setForFuncSearch(Z)Lcom/flyersoft/moonreaderp/PrefOptions;
    .locals 0

    .line 263
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->forFuncSearch:Z

    return-object p0
.end method

.method public setFullscreen(Z)Lcom/flyersoft/moonreaderp/PrefOptions;
    .locals 0

    .line 130
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->fullscreen:Z

    return-object p0
.end method

.method public setFuncSearchVisible(I)Lcom/flyersoft/moonreaderp/PrefOptions;
    .locals 2

    .line 270
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->searchView:Landroidx/appcompat/widget/SearchView;

    if-eqz v0, :cond_1

    .line 271
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/SearchView;->setVisibility(I)V

    if-nez p1, :cond_1

    .line 273
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->searchView:Landroidx/appcompat/widget/SearchView;

    const v0, -0x777778

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setImageViewTint(Landroid/view/View;I)V

    .line 274
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->searchView:Landroidx/appcompat/widget/SearchView;

    sget v0, Landroidx/appcompat/R$id;->search_src_text:I

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->searchAutoComplete:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    const/4 v0, 0x0

    .line 275
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;->setThreshold(I)V

    .line 276
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->searchAutoComplete:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v1

    if-eqz v1, :cond_0

    const v1, -0x111112

    goto :goto_0

    :cond_0
    const v1, -0xddddde

    :goto_0
    invoke-virtual {p1, v1}, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;->setTextColor(I)V

    .line 277
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->searchAutoComplete:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->function_search:I

    invoke-virtual {p1, v1}, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;->setHint(I)V

    .line 278
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->searchView:Landroidx/appcompat/widget/SearchView;

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setSubmitButtonEnabled(Z)V

    .line 280
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->searchView:Landroidx/appcompat/widget/SearchView;

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefOptions$4;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefOptions$4;-><init>(Lcom/flyersoft/moonreaderp/PrefOptions;)V

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Landroidx/appcompat/widget/SearchView$OnQueryTextListener;)V

    .line 293
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->searchView:Landroidx/appcompat/widget/SearchView;

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefOptions$5;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefOptions$5;-><init>(Lcom/flyersoft/moonreaderp/PrefOptions;)V

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setOnCloseListener(Landroidx/appcompat/widget/SearchView$OnCloseListener;)V

    .line 300
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->searchView:Landroidx/appcompat/widget/SearchView;

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefOptions$6;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefOptions$6;-><init>(Lcom/flyersoft/moonreaderp/PrefOptions;)V

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setOnSuggestionListener(Landroidx/appcompat/widget/SearchView$OnSuggestionListener;)V

    .line 310
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->searchView:Landroidx/appcompat/widget/SearchView;

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefOptions$7;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefOptions$7;-><init>(Lcom/flyersoft/moonreaderp/PrefOptions;)V

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setOnSearchClickListener(Landroid/view/View$OnClickListener;)V

    :cond_1
    return-object p0
.end method

.method public setGravity(I)Lcom/flyersoft/moonreaderp/PrefOptions;
    .locals 0

    .line 120
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->gravity:I

    return-object p0
.end method

.method public setHeight(I)Lcom/flyersoft/moonreaderp/PrefOptions;
    .locals 0

    .line 110
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->height:I

    return-object p0
.end method

.method public setHideExit(Z)Lcom/flyersoft/moonreaderp/PrefOptions;
    .locals 0

    .line 135
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->hideExit:Z

    return-object p0
.end method

.method public setStatusBarColor(I)Lcom/flyersoft/moonreaderp/PrefOptions;
    .locals 0

    .line 125
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->statusBarColor:I

    return-object p0
.end method

.method public setWidth(I)Lcom/flyersoft/moonreaderp/PrefOptions;
    .locals 0

    .line 115
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefOptions;->width:I

    return-object p0
.end method
