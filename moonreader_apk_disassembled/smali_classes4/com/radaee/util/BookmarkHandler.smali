.class public Lcom/radaee/util/BookmarkHandler;
.super Ljava/lang/Object;
.source "BookmarkHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;,
        Lcom/radaee/util/BookmarkHandler$Bookmark;,
        Lcom/radaee/util/BookmarkHandler$BookmarkStatus;,
        Lcom/radaee/util/BookmarkHandler$BookmarkListener;
    }
.end annotation


# static fields
.field private static mDbPath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;Landroid/app/AlertDialog;Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;Landroid/view/View;ILjava/lang/String;)V
    .locals 0

    .line 31
    invoke-static/range {p0 .. p5}, Lcom/radaee/util/BookmarkHandler;->showPopupMenu(Landroid/content/Context;Landroid/app/AlertDialog;Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;Landroid/view/View;ILjava/lang/String;)V

    return-void
.end method

.method public static addToBookmarks(Ljava/lang/String;ILjava/lang/String;)Lcom/radaee/util/BookmarkHandler$BookmarkStatus;
    .locals 1

    .line 65
    new-instance v0, Lcom/radaee/util/BookmarkHandler$Bookmark;

    invoke-direct {v0, p1, p2}, Lcom/radaee/util/BookmarkHandler$Bookmark;-><init>(ILjava/lang/String;)V

    invoke-static {p0, v0}, Lcom/radaee/util/BookmarkHandler;->addToBookmarks(Ljava/lang/String;Lcom/radaee/util/BookmarkHandler$Bookmark;)Lcom/radaee/util/BookmarkHandler$BookmarkStatus;

    move-result-object p0

    return-object p0
.end method

.method public static addToBookmarks(Ljava/lang/String;Lcom/radaee/util/BookmarkHandler$Bookmark;)Lcom/radaee/util/BookmarkHandler$BookmarkStatus;
    .locals 3

    .line 70
    :try_start_0
    invoke-static {}, Lcom/radaee/util/BookmarkHandler;->openOrCreateDB()Lcom/radaee/pdf/BMDatabase;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 72
    invoke-virtual {v0, p0}, Lcom/radaee/pdf/BMDatabase;->RecOpen(Ljava/lang/String;)J

    move-result-wide v1

    .line 73
    iget p0, p1, Lcom/radaee/util/BookmarkHandler$Bookmark;->page:I

    invoke-static {v0, v1, v2, p0}, Lcom/radaee/util/BookmarkHandler;->isBookmarkAlreadyAdded(Lcom/radaee/pdf/BMDatabase;JI)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 74
    sget-object p0, Lcom/radaee/util/BookmarkHandler$BookmarkStatus;->ALREADY_ADDED:Lcom/radaee/util/BookmarkHandler$BookmarkStatus;

    return-object p0

    .line 75
    :cond_0
    iget-object p0, p1, Lcom/radaee/util/BookmarkHandler$Bookmark;->bmLabel:Ljava/lang/String;

    iget p1, p1, Lcom/radaee/util/BookmarkHandler$Bookmark;->page:I

    invoke-virtual {v0, v1, v2, p0, p1}, Lcom/radaee/pdf/BMDatabase;->RecItemInsert(JLjava/lang/String;I)Z

    move-result p0

    .line 76
    invoke-virtual {v0, v1, v2}, Lcom/radaee/pdf/BMDatabase;->RecClose(J)V

    .line 77
    invoke-virtual {v0}, Lcom/radaee/pdf/BMDatabase;->Close()V

    if-eqz p0, :cond_1

    .line 78
    sget-object p0, Lcom/radaee/util/BookmarkHandler$BookmarkStatus;->SUCCESS:Lcom/radaee/util/BookmarkHandler$BookmarkStatus;

    return-object p0

    :cond_1
    sget-object p0, Lcom/radaee/util/BookmarkHandler$BookmarkStatus;->ERROR_UNKNOWN:Lcom/radaee/util/BookmarkHandler$BookmarkStatus;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 81
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 84
    :cond_2
    sget-object p0, Lcom/radaee/util/BookmarkHandler$BookmarkStatus;->ERROR_UNKNOWN:Lcom/radaee/util/BookmarkHandler$BookmarkStatus;

    return-object p0
.end method

.method public static getBookmarks(Ljava/lang/String;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/radaee/util/BookmarkHandler$Bookmark;",
            ">;"
        }
    .end annotation

    .line 154
    invoke-static {}, Lcom/radaee/util/BookmarkHandler;->openOrCreateDB()Lcom/radaee/pdf/BMDatabase;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 156
    invoke-virtual {v0, p0}, Lcom/radaee/pdf/BMDatabase;->RecOpen(Ljava/lang/String;)J

    move-result-wide v2

    .line 157
    invoke-virtual {v0, v2, v3}, Lcom/radaee/pdf/BMDatabase;->RecGetCount(J)I

    move-result p0

    if-lez p0, :cond_0

    .line 160
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v4, 0x0

    :goto_0
    if-ge v4, p0, :cond_0

    .line 162
    new-instance v5, Lcom/radaee/util/BookmarkHandler$Bookmark;

    invoke-virtual {v0, v2, v3, v4}, Lcom/radaee/pdf/BMDatabase;->RecItemGetPage(JI)I

    move-result v6

    invoke-virtual {v0, v2, v3, v4}, Lcom/radaee/pdf/BMDatabase;->RecItemGetName(JI)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lcom/radaee/util/BookmarkHandler$Bookmark;-><init>(ILjava/lang/String;)V

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 165
    :cond_0
    invoke-virtual {v0, v2, v3}, Lcom/radaee/pdf/BMDatabase;->RecClose(J)V

    .line 166
    invoke-virtual {v0}, Lcom/radaee/pdf/BMDatabase;->Close()V

    :cond_1
    return-object v1
.end method

.method public static getBookmarksAsJson(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 174
    invoke-static {p0}, Lcom/radaee/util/BookmarkHandler;->getBookmarks(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 176
    :try_start_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 177
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 178
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/radaee/util/BookmarkHandler$Bookmark;

    .line 179
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 180
    const-string v3, "Page"

    iget v4, v1, Lcom/radaee/util/BookmarkHandler$Bookmark;->page:I

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 181
    const-string v3, "Label"

    iget-object v1, v1, Lcom/radaee/util/BookmarkHandler$Bookmark;->bmLabel:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 182
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .line 184
    :cond_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 187
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getDbPath()Ljava/lang/String;
    .locals 1

    .line 36
    sget-object v0, Lcom/radaee/util/BookmarkHandler;->mDbPath:Ljava/lang/String;

    return-object v0
.end method

.method private static isBookmarkAlreadyAdded(Lcom/radaee/pdf/BMDatabase;JI)Z
    .locals 4

    .line 193
    invoke-virtual {p0, p1, p2}, Lcom/radaee/pdf/BMDatabase;->RecGetCount(J)I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    .line 195
    invoke-virtual {p0, p1, p2, v2}, Lcom/radaee/pdf/BMDatabase;->RecItemGetPage(JI)I

    move-result v3

    if-ne v3, p3, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method private static openOrCreateDB()Lcom/radaee/pdf/BMDatabase;
    .locals 3

    .line 58
    new-instance v0, Lcom/radaee/pdf/BMDatabase;

    invoke-direct {v0}, Lcom/radaee/pdf/BMDatabase;-><init>()V

    .line 59
    sget-object v1, Lcom/radaee/util/BookmarkHandler;->mDbPath:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/radaee/pdf/Global;->tmp_path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/Bookmarks.db"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    sget-object v1, Lcom/radaee/util/BookmarkHandler;->mDbPath:Ljava/lang/String;

    :goto_0
    invoke-virtual {v0, v1}, Lcom/radaee/pdf/BMDatabase;->OpenOrCreate(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static removeBookmark(ILjava/lang/String;)Z
    .locals 2

    .line 88
    new-instance v0, Lcom/radaee/util/BookmarkHandler$Bookmark;

    const-string v1, ""

    invoke-direct {v0, p0, v1}, Lcom/radaee/util/BookmarkHandler$Bookmark;-><init>(ILjava/lang/String;)V

    invoke-static {v0, p1}, Lcom/radaee/util/BookmarkHandler;->removeBookmark(Lcom/radaee/util/BookmarkHandler$Bookmark;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static removeBookmark(Lcom/radaee/util/BookmarkHandler$Bookmark;Ljava/lang/String;)Z
    .locals 7

    const/4 v0, 0x0

    .line 93
    :try_start_0
    invoke-static {}, Lcom/radaee/util/BookmarkHandler;->openOrCreateDB()Lcom/radaee/pdf/BMDatabase;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 95
    invoke-virtual {v1, p1}, Lcom/radaee/pdf/BMDatabase;->RecOpen(Ljava/lang/String;)J

    move-result-wide v2

    .line 96
    invoke-virtual {v1, v2, v3}, Lcom/radaee/pdf/BMDatabase;->RecGetCount(J)I

    move-result p1

    const/4 v4, 0x0

    :goto_0
    if-ge v4, p1, :cond_1

    .line 99
    invoke-virtual {v1, v2, v3, v4}, Lcom/radaee/pdf/BMDatabase;->RecItemGetPage(JI)I

    move-result v5

    iget v6, p0, Lcom/radaee/util/BookmarkHandler$Bookmark;->page:I

    if-ne v5, v6, :cond_0

    .line 100
    invoke-virtual {v1, v2, v3, v4}, Lcom/radaee/pdf/BMDatabase;->RecItemRemove(JI)Z

    move-result p0

    goto :goto_1

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    .line 105
    :goto_1
    invoke-virtual {v1, v2, v3}, Lcom/radaee/pdf/BMDatabase;->RecClose(J)V

    .line 106
    invoke-virtual {v1}, Lcom/radaee/pdf/BMDatabase;->Close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 111
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_2
    return v0
.end method

.method public static setDbPath(Ljava/lang/String;)V
    .locals 0

    .line 40
    sput-object p0, Lcom/radaee/util/BookmarkHandler;->mDbPath:Ljava/lang/String;

    return-void
.end method

.method public static showBookmarks(Landroid/content/Context;Ljava/lang/String;Lcom/radaee/util/BookmarkHandler$BookmarkListener;)V
    .locals 5

    .line 117
    sget v0, Lcom/radaee/viewlib/R$string;->bookmarks:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$string;->loading:I

    .line 118
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 117
    invoke-static {p0, v0, v1, v2, v3}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZ)Landroid/app/ProgressDialog;

    move-result-object v0

    .line 119
    invoke-static {p1}, Lcom/radaee/util/BookmarkHandler;->getBookmarks(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 120
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 121
    new-instance v2, Landroid/widget/ListView;

    invoke-direct {v2, p0}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 123
    new-instance v3, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;

    invoke-direct {v3, p0, v1}, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    .line 124
    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 126
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v4, Lcom/radaee/viewlib/R$string;->bookmarks:I

    .line 127
    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 128
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 129
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v1

    .line 131
    new-instance v4, Lcom/radaee/util/BookmarkHandler$1;

    invoke-direct {v4, p2, v1}, Lcom/radaee/util/BookmarkHandler$1;-><init>(Lcom/radaee/util/BookmarkHandler$BookmarkListener;Landroid/app/AlertDialog;)V

    invoke-virtual {v2, v4}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 140
    new-instance p2, Lcom/radaee/util/BookmarkHandler$2;

    invoke-direct {p2, p0, v1, v3, p1}, Lcom/radaee/util/BookmarkHandler$2;-><init>(Landroid/content/Context;Landroid/app/AlertDialog;Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    goto :goto_0

    .line 149
    :cond_0
    sget p1, Lcom/radaee/viewlib/R$string;->no_bookmarks:I

    invoke-static {p0, p1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 150
    :goto_0
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    return-void
.end method

.method private static showPopupMenu(Landroid/content/Context;Landroid/app/AlertDialog;Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;Landroid/view/View;ILjava/lang/String;)V
    .locals 8

    .line 203
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$layout;->bookmark_popup_menu:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 204
    new-instance v7, Landroid/widget/PopupWindow;

    invoke-direct {v7, v0}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;)V

    const/4 v1, 0x1

    .line 205
    invoke-virtual {v7, v1}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 206
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v2, 0x42c80000    # 100.0f

    mul-float v2, v2, v1

    float-to-int v2, v2

    .line 207
    invoke-virtual {v7, v2}, Landroid/widget/PopupWindow;->setWidth(I)V

    const/high16 v2, 0x42480000    # 50.0f

    mul-float v1, v1, v2

    float-to-int v1, v1

    .line 208
    invoke-virtual {v7, v1}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 209
    invoke-virtual {p3}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {v7}, Landroid/widget/PopupWindow;->getWidth()I

    move-result v2

    sub-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {v7}, Landroid/widget/PopupWindow;->getHeight()I

    move-result v2

    neg-int v2, v2

    div-int/lit8 v2, v2, 0x2

    invoke-virtual {v7, p3, v1, v2}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;II)V

    .line 211
    sget p3, Lcom/radaee/viewlib/R$id;->delete:I

    invoke-virtual {v0, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    new-instance v1, Lcom/radaee/util/BookmarkHandler$3;

    move-object v6, p0

    move-object v5, p1

    move-object v2, p2

    move v3, p4

    move-object v4, p5

    invoke-direct/range {v1 .. v7}, Lcom/radaee/util/BookmarkHandler$3;-><init>(Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;ILjava/lang/String;Landroid/app/AlertDialog;Landroid/content/Context;Landroid/widget/PopupWindow;)V

    invoke-virtual {p3, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
