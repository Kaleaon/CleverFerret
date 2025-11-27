.class Lcom/flyersoft/components/WidgetFactory;
.super Ljava/lang/Object;
.source "WidgetService.java"

# interfaces
.implements Landroid/widget/RemoteViewsService$RemoteViewsFactory;


# instance fields
.field private appWidgetId:I

.field books:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;"
        }
    .end annotation
.end field

.field private context:Landroid/content/Context;

.field list:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mDb:Landroid/database/sqlite/SQLiteDatabase;

.field private mDbHelper:Lcom/flyersoft/tools/BookDb$BookDBHelper;

.field sp1:Landroid/content/SharedPreferences;

.field style:I

.field widget_type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/flyersoft/components/WidgetFactory;->context:Landroid/content/Context;

    .line 41
    const-string p1, "appWidgetId"

    const/4 v0, 0x0

    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/flyersoft/components/WidgetFactory;->appWidgetId:I

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/flyersoft/components/WidgetFactory;->books:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/WidgetFactory;->list:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public getDb()Landroid/database/sqlite/SQLiteDatabase;
    .locals 4

    .line 59
    sget-object v0, Lcom/flyersoft/tools/A;->appContext:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 60
    iget-object v0, p0, Lcom/flyersoft/components/WidgetFactory;->context:Landroid/content/Context;

    sput-object v0, Lcom/flyersoft/tools/A;->widgetContext:Landroid/content/Context;

    .line 61
    :cond_0
    sget-object v0, Lcom/flyersoft/tools/A;->default_book_folder:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 62
    sget-object v0, Lcom/flyersoft/tools/A;->appContext:Landroid/content/Context;

    if-eqz v0, :cond_1

    .line 63
    sget-object v0, Lcom/flyersoft/tools/A;->appContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->LoadOptions(Landroid/content/Context;)V

    goto :goto_0

    .line 65
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/components/WidgetFactory;->context:Landroid/content/Context;

    const-string v1, "options1002"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "default_book_folder"

    const-string v3, "/sdcard/Books"

    .line 66
    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/tools/A;->default_book_folder:Ljava/lang/String;

    .line 67
    invoke-static {v2}, Lcom/flyersoft/tools/A;->initPathParameters(Z)V

    .line 70
    :cond_2
    :goto_0
    sget-object v0, Lcom/flyersoft/tools/A;->appContext:Landroid/content/Context;

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 71
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0

    .line 72
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/components/WidgetFactory;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v0, :cond_4

    .line 74
    :try_start_0
    new-instance v0, Lcom/flyersoft/tools/BookDb$BookDBHelper;

    iget-object v1, p0, Lcom/flyersoft/components/WidgetFactory;->context:Landroid/content/Context;

    const-string v2, "mrbooks.db"

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/tools/BookDb$BookDBHelper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/flyersoft/components/WidgetFactory;->mDbHelper:Lcom/flyersoft/tools/BookDb$BookDBHelper;

    .line 75
    invoke-virtual {v0}, Lcom/flyersoft/tools/BookDb$BookDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/WidgetFactory;->mDb:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 77
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    return-object v0

    .line 81
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/flyersoft/components/WidgetFactory;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getLoadingView()Landroid/widget/RemoteViews;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getViewAt(I)Landroid/widget/RemoteViews;
    .locals 23

    move-object/from16 v1, p0

    move/from16 v0, p1

    .line 85
    const-string v2, "\n"

    const-string v3, ":"

    .line 0
    const-string v4, " "

    const-string v5, "<b>"

    .line 85
    new-instance v6, Landroid/widget/RemoteViews;

    iget-object v7, v1, Lcom/flyersoft/components/WidgetFactory;->context:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    .line 86
    iget v8, v1, Lcom/flyersoft/components/WidgetFactory;->style:I

    const/4 v9, 0x2

    const/4 v10, 0x1

    if-nez v8, :cond_0

    sget v8, Lcom/flyersoft/moonreaderp/R$layout;->appwidget_history_item:I

    goto :goto_0

    :cond_0
    if-ne v8, v10, :cond_1

    .line 87
    sget v8, Lcom/flyersoft/moonreaderp/R$layout;->appwidget_history_item_night:I

    goto :goto_0

    :cond_1
    if-ne v8, v9, :cond_2

    .line 88
    sget v8, Lcom/flyersoft/moonreaderp/R$layout;->appwidget_history_item_alpha:I

    goto :goto_0

    .line 89
    :cond_2
    sget v8, Lcom/flyersoft/moonreaderp/R$layout;->appwidget_history_item_amoled:I

    :goto_0
    invoke-direct {v6, v7, v8}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 93
    :try_start_0
    iget-object v7, v1, Lcom/flyersoft/components/WidgetFactory;->books:Ljava/util/ArrayList;

    const-wide/16 v11, -0x1

    const/4 v8, 0x0

    if-eqz v7, :cond_4

    .line 94
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lt v0, v7, :cond_3

    const/4 v0, 0x0

    .line 96
    :cond_3
    iget-object v7, v1, Lcom/flyersoft/components/WidgetFactory;->books:Ljava/util/ArrayList;

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 97
    iget-object v7, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    goto :goto_1

    .line 99
    :cond_4
    iget-object v7, v1, Lcom/flyersoft/components/WidgetFactory;->list:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lt v0, v7, :cond_5

    const/4 v0, 0x0

    .line 101
    :cond_5
    iget-object v7, v1, Lcom/flyersoft/components/WidgetFactory;->list:Ljava/util/ArrayList;

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Ljava/lang/String;

    .line 102
    invoke-virtual {v1}, Lcom/flyersoft/components/WidgetFactory;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-static {v0, v7, v11, v12}, Lcom/flyersoft/tools/BookDb;->getBook(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;J)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v0

    .line 104
    :goto_1
    invoke-virtual {v1}, Lcom/flyersoft/components/WidgetFactory;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v13

    invoke-static {v13, v7}, Lcom/flyersoft/tools/A;->getShelfCoverFile(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    if-nez v0, :cond_6

    .line 105
    invoke-static {v7}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_6
    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    :goto_2
    move-object v14, v0

    .line 106
    const-string v0, "0%"

    .line 107
    iget-object v15, v1, Lcom/flyersoft/components/WidgetFactory;->sp1:Landroid/content/SharedPreferences;

    if-nez v15, :cond_7

    .line 108
    iget-object v15, v1, Lcom/flyersoft/components/WidgetFactory;->context:Landroid/content/Context;

    move-wide/from16 v16, v11

    const-string v11, "positions10"

    invoke-virtual {v15, v11, v8}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v11

    iput-object v11, v1, Lcom/flyersoft/components/WidgetFactory;->sp1:Landroid/content/SharedPreferences;

    goto :goto_3

    :cond_7
    move-wide/from16 v16, v11

    .line 109
    :goto_3
    iget-object v11, v1, Lcom/flyersoft/components/WidgetFactory;->sp1:Landroid/content/SharedPreferences;

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v11
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4

    const-string v12, ""

    if-eqz v11, :cond_8

    .line 110
    :try_start_1
    iget-object v11, v1, Lcom/flyersoft/components/WidgetFactory;->sp1:Landroid/content/SharedPreferences;

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v15

    invoke-interface {v11, v15, v12}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 111
    invoke-virtual {v11, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v15

    const/4 v9, -0x1

    if-eq v15, v9, :cond_8

    .line 112
    invoke-virtual {v11, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    add-int/2addr v0, v10

    invoke-virtual {v11, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    :cond_8
    move-object v3, v0

    .line 116
    invoke-virtual {v1}, Lcom/flyersoft/components/WidgetFactory;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-static {v0, v7, v8}, Lcom/flyersoft/tools/BookDb;->getSavedStatistics(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Z)Lcom/flyersoft/tools/BookDb$ReadStatistics;

    move-result-object v0

    if-eqz v0, :cond_c

    .line 117
    iget-object v11, v0, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dates:Ljava/lang/String;

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4

    if-lez v11, :cond_c

    .line 119
    :try_start_2
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getStatisticsDayOff()J

    move-result-wide v18

    .line 120
    invoke-static {}, Ljava/text/DateFormat;->getDateInstance()Ljava/text/DateFormat;

    move-result-object v11

    .line 121
    iget-object v15, v0, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dates:Ljava/lang/String;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dates:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v10

    invoke-virtual {v15, v8, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 122
    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v15
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    const/16 v20, 0x1

    int-to-long v9, v15

    .line 123
    :try_start_3
    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    move-wide/from16 v21, v9

    int-to-long v8, v2

    cmp-long v2, v21, v16

    if-nez v2, :cond_9

    move-object v10, v0

    move-object v2, v14

    goto :goto_4

    :cond_9
    move-object v2, v14

    move-wide/from16 v14, v21

    long-to-int v15, v14

    const/4 v10, 0x0

    .line 124
    :try_start_4
    invoke-virtual {v0, v10, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    :goto_4
    invoke-static {v10}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v10

    int-to-long v14, v10

    cmp-long v10, v14, v16

    if-nez v10, :cond_a

    move-wide/from16 v8, v16

    goto :goto_5

    :cond_a
    long-to-int v9, v8

    add-int/lit8 v9, v9, 0x1

    .line 125
    invoke-virtual {v0, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v0

    int-to-long v8, v0

    :goto_5
    const-wide/32 v21, 0x5265c00

    mul-long v14, v14, v21

    cmp-long v0, v8, v16

    if-eqz v0, :cond_b

    mul-long v8, v8, v21

    cmp-long v0, v8, v14

    if-eqz v0, :cond_b

    add-long v8, v8, v18

    .line 131
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v11, v0}, Ljava/text/DateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_6

    :cond_b
    const/4 v9, 0x0

    :goto_6
    if-nez v9, :cond_d

    add-long v14, v14, v18

    .line 134
    :try_start_5
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v11, v0}, Ljava/text/DateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    move-object v9, v0

    goto :goto_9

    :catch_0
    move-exception v0

    goto :goto_8

    :catch_1
    move-exception v0

    goto :goto_7

    :catch_2
    move-exception v0

    move-object v2, v14

    goto :goto_7

    :catch_3
    move-exception v0

    move-object v2, v14

    const/16 v20, 0x1

    :goto_7
    const/4 v9, 0x0

    .line 136
    :goto_8
    :try_start_6
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_9

    :cond_c
    move-object v2, v14

    const/16 v20, 0x1

    const/4 v9, 0x0

    .line 139
    :cond_d
    :goto_9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "</b>"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez v9, :cond_e

    goto :goto_a

    :cond_e
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    :goto_a
    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 141
    const-string v3, "/"

    invoke-virtual {v13, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 142
    iget-object v3, v1, Lcom/flyersoft/components/WidgetFactory;->context:Landroid/content/Context;

    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v5, 0x2

    const/4 v8, 0x1

    invoke-static {v3, v4, v5, v8}, Lcom/flyersoft/tools/A;->getFileBitmap(Landroid/content/Context;Ljava/io/File;II)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 143
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->widgetCover:I

    invoke-virtual {v6, v4, v3}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    goto :goto_b

    .line 145
    :cond_f
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->widgetCover:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v6, v3, v4}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 146
    :goto_b
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->name:I

    invoke-virtual {v6, v3, v2}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 147
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->detail:I

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {v6, v2, v0}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 149
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 150
    const-string v2, "bookFile"

    invoke-virtual {v0, v2, v7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    const-string v2, "fromWidget"

    const/4 v8, 0x1

    invoke-virtual {v0, v2, v8}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 152
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 153
    invoke-virtual {v2, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 154
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->row:I

    invoke-virtual {v6, v0, v2}, Landroid/widget/RemoteViews;->setOnClickFillInIntent(ILandroid/content/Intent;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    goto :goto_c

    :catch_4
    move-exception v0

    .line 157
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_c
    return-object v6
.end method

.method public getViewTypeCount()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public hasStableIds()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onCreate()V
    .locals 3

    const/4 v0, 0x1

    .line 45
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "RemoteViewsService:onCreate"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return-void
.end method

.method public onDataSetChanged()V
    .locals 6

    .line 184
    iget-object v0, p0, Lcom/flyersoft/components/WidgetFactory;->context:Landroid/content/Context;

    const-string v1, "widget"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 185
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, p0, Lcom/flyersoft/components/WidgetFactory;->appWidgetId:I

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v4, "#0"

    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/components/WidgetFactory;->widget_type:Ljava/lang/String;

    .line 186
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v5, p0, Lcom/flyersoft/components/WidgetFactory;->appWidgetId:I

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "_style"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/flyersoft/components/WidgetFactory;->style:I

    const/4 v0, 0x0

    .line 187
    iput-object v0, p0, Lcom/flyersoft/components/WidgetFactory;->list:Ljava/util/ArrayList;

    .line 188
    iput-object v0, p0, Lcom/flyersoft/components/WidgetFactory;->books:Ljava/util/ArrayList;

    .line 190
    iget-object v1, p0, Lcom/flyersoft/components/WidgetFactory;->widget_type:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v4, 0x1

    if-eqz v1, :cond_1

    .line 191
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/components/WidgetFactory;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/shared_prefs"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 192
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/history.txt"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFileText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    move-object v3, v0

    .line 193
    :goto_0
    invoke-static {v3}, Lcom/flyersoft/tools/T;->text2StringList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/WidgetFactory;->list:Ljava/util/ArrayList;

    .line 194
    :goto_1
    iget-object v0, p0, Lcom/flyersoft/components/WidgetFactory;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0xf

    if-le v0, v1, :cond_3

    .line 195
    iget-object v0, p0, Lcom/flyersoft/components/WidgetFactory;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr v1, v4

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_1

    .line 197
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/components/WidgetFactory;->widget_type:Ljava/lang/String;

    const-string v3, "#1"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "default_fav"

    goto :goto_2

    :cond_2
    iget-object v1, p0, Lcom/flyersoft/components/WidgetFactory;->widget_type:Ljava/lang/String;

    .line 198
    :goto_2
    invoke-virtual {p0}, Lcom/flyersoft/components/WidgetFactory;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string v5, "favorite"

    invoke-static {v3, v5, v1, v0, v2}, Lcom/flyersoft/tools/BookDb;->getBooks(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/components/WidgetFactory;->books:Ljava/util/ArrayList;

    .line 201
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "RemoteViewsService: onDataSetChanged:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/flyersoft/components/WidgetFactory;->appWidgetId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/components/WidgetFactory;->widget_type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-array v1, v4, [Ljava/lang/Object;

    aput-object v0, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return-void
.end method

.method public onDestroy()V
    .locals 0

    return-void
.end method
