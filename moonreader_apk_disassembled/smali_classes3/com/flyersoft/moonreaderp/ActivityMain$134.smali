.class Lcom/flyersoft/moonreaderp/ActivityMain$134;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->initStatisticsAnnotLv()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 12204
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8

    .line 12207
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    .line 12208
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 12209
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->annotsLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getVisibility()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 12210
    :goto_0
    const-string v4, ""

    if-eqz v1, :cond_1

    move-object v5, v4

    goto :goto_1

    :cond_1
    const-string v5, " and filename=?"

    :goto_1
    if-eqz v1, :cond_2

    const/4 v1, 0x0

    goto :goto_2

    .line 12211
    :cond_2
    new-array v1, v2, [Ljava/lang/String;

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v6}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetannotLastBookFile(Lcom/flyersoft/moonreaderp/ActivityMain;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v1, v3

    .line 12214
    :goto_2
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v6, v6, Lcom/flyersoft/moonreaderp/ActivityMain;->annotFilter:I

    if-eqz v6, :cond_3

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v6, v6, Lcom/flyersoft/moonreaderp/ActivityMain;->annotFilter:I

    if-ne v6, v2, :cond_6

    .line 12215
    :cond_3
    const-string v2, "SELECT distinct highlightLength FROM notes where bookmark!=\'\'"

    invoke-virtual {v2, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 12216
    :cond_4
    :goto_3
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 12217
    invoke-interface {v2, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    if-eqz v6, :cond_4

    .line 12218
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 12219
    :cond_5
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 12221
    :cond_6
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->annotFilter:I

    const/4 v6, 0x2

    if-eqz v2, :cond_7

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->annotFilter:I

    if-eq v2, v6, :cond_7

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->annotFilter:I

    const/4 v7, 0x3

    if-ne v2, v7, :cond_b

    .line 12222
    :cond_7
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->annotFilter:I

    if-nez v2, :cond_8

    .line 12223
    const-string v2, "SELECT distinct highlightColor FROM notes where bookmark=\'\'"

    invoke-virtual {v2, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    goto :goto_4

    .line 12224
    :cond_8
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->annotFilter:I

    if-ne v2, v6, :cond_9

    .line 12225
    const-string v2, "SELECT distinct highlightColor FROM notes where bookmark=\'\' and note!=\'\'"

    invoke-virtual {v2, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    goto :goto_4

    .line 12227
    :cond_9
    const-string v2, "SELECT distinct highlightColor FROM notes where bookmark=\'\' and note=\'\'"

    invoke-virtual {v2, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    .line 12228
    :goto_4
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 12229
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 12230
    :cond_a
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 12233
    :cond_b
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_d

    .line 12234
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->filterColors:[Ljava/lang/String;

    .line 12235
    :goto_5
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->filterColors:[Ljava/lang/String;

    array-length p1, p1

    if-ge v3, p1, :cond_c

    .line 12236
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->filterColors:[Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "#color#"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->filterColors:[Ljava/lang/String;

    aget-object v1, v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, p1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 12238
    :cond_c
    new-instance p1, Lcom/flyersoft/components/MyMenu;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p1, v0}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->filterColors:[Ljava/lang/String;

    new-instance v1, Lcom/flyersoft/moonreaderp/ActivityMain$134$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$134$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$134;)V

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->highlight_color:I

    .line 12245
    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyMenu;->setTitle(I)Lcom/flyersoft/components/MyMenu;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyMenu;->show()V

    return-void

    .line 12247
    :cond_d
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$134;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->highlight_color:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void
.end method
