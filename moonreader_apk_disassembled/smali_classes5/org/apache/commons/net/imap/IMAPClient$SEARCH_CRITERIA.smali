.class public final enum Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;
.super Ljava/lang/Enum;
.source "IMAPClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/net/imap/IMAPClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SEARCH_CRITERIA"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum ALL:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum ANSWERED:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum BCC:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum BEFORE:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum BODY:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum CC:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum DELETED:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum DRAFT:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum FLAGGED:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum FROM:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum HEADER:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum KEYWORD:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum LARGER:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum NEW:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum NOT:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum OLD:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum ON:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum OR:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum RECENT:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum SEEN:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum SENTBEFORE:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum SENTON:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum SENTSINCE:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum SINCE:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum SMALLER:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum SUBJECT:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum TEXT:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum TO:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum UID:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum UNANSWERED:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum UNDELETED:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum UNDRAFT:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum UNFLAGGED:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum UNKEYWORD:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

.field public static final enum UNSEEN:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;


# direct methods
.method static constructor <clinit>()V
    .locals 59

    .line 458
    new-instance v0, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const-string v1, "ALL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->ALL:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 460
    new-instance v1, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const-string v3, "ANSWERED"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->ANSWERED:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 465
    new-instance v3, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const-string v5, "BCC"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->BCC:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 470
    new-instance v5, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const-string v7, "BEFORE"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->BEFORE:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 475
    new-instance v7, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const-string v9, "BODY"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->BODY:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 480
    new-instance v9, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const-string v11, "CC"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->CC:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 482
    new-instance v11, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const-string v13, "DELETED"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->DELETED:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 484
    new-instance v13, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const-string v15, "DRAFT"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->DRAFT:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 486
    new-instance v15, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const/16 v17, 0x7

    const-string v2, "FLAGGED"

    const/16 v18, 0x1

    const/16 v4, 0x8

    invoke-direct {v15, v2, v4}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->FLAGGED:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 491
    new-instance v2, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const/16 v19, 0x8

    const-string v4, "FROM"

    const/16 v20, 0x2

    const/16 v6, 0x9

    invoke-direct {v2, v4, v6}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->FROM:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 500
    new-instance v4, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const/16 v21, 0x9

    const-string v6, "HEADER"

    const/16 v22, 0x3

    const/16 v8, 0xa

    invoke-direct {v4, v6, v8}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->HEADER:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 502
    new-instance v6, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const/16 v23, 0xa

    const-string v8, "KEYWORD"

    const/16 v24, 0x4

    const/16 v10, 0xb

    invoke-direct {v6, v8, v10}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->KEYWORD:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 507
    new-instance v8, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const/16 v25, 0xb

    const-string v10, "LARGER"

    const/16 v26, 0x5

    const/16 v12, 0xc

    invoke-direct {v8, v10, v12}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v8, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->LARGER:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 512
    new-instance v10, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const/16 v27, 0xc

    const-string v12, "NEW"

    const/16 v28, 0x6

    const/16 v14, 0xd

    invoke-direct {v10, v12, v14}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v10, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->NEW:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 514
    new-instance v12, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const/16 v29, 0xd

    const-string v14, "NOT"

    move-object/from16 v30, v0

    const/16 v0, 0xe

    invoke-direct {v12, v14, v0}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v12, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->NOT:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 520
    new-instance v14, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const/16 v31, 0xe

    const-string v0, "OLD"

    move-object/from16 v32, v1

    const/16 v1, 0xf

    invoke-direct {v14, v0, v1}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v14, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->OLD:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 525
    new-instance v0, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const/16 v33, 0xf

    const-string v1, "ON"

    move-object/from16 v34, v2

    const/16 v2, 0x10

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->ON:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 527
    new-instance v1, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const/16 v35, 0x10

    const-string v2, "OR"

    move-object/from16 v36, v0

    const/16 v0, 0x11

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->OR:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 529
    new-instance v2, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const/16 v37, 0x11

    const-string v0, "RECENT"

    move-object/from16 v38, v1

    const/16 v1, 0x12

    invoke-direct {v2, v0, v1}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->RECENT:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 531
    new-instance v0, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const/16 v39, 0x12

    const-string v1, "SEEN"

    move-object/from16 v40, v2

    const/16 v2, 0x13

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->SEEN:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 536
    new-instance v1, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const/16 v41, 0x13

    const-string v2, "SENTBEFORE"

    move-object/from16 v42, v0

    const/16 v0, 0x14

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->SENTBEFORE:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 541
    new-instance v2, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const/16 v43, 0x14

    const-string v0, "SENTON"

    move-object/from16 v44, v1

    const/16 v1, 0x15

    invoke-direct {v2, v0, v1}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->SENTON:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 546
    new-instance v0, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const/16 v45, 0x15

    const-string v1, "SENTSINCE"

    move-object/from16 v46, v2

    const/16 v2, 0x16

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->SENTSINCE:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 551
    new-instance v1, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const-string v2, "SINCE"

    move-object/from16 v47, v0

    const/16 v0, 0x17

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->SINCE:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 556
    new-instance v0, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const-string v2, "SMALLER"

    move-object/from16 v48, v1

    const/16 v1, 0x18

    invoke-direct {v0, v2, v1}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->SMALLER:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 561
    new-instance v1, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const-string v2, "SUBJECT"

    move-object/from16 v49, v0

    const/16 v0, 0x19

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->SUBJECT:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 566
    new-instance v0, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const-string v2, "TEXT"

    move-object/from16 v50, v1

    const/16 v1, 0x1a

    invoke-direct {v0, v2, v1}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->TEXT:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 571
    new-instance v1, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const-string v2, "TO"

    move-object/from16 v51, v0

    const/16 v0, 0x1b

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->TO:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 576
    new-instance v0, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const-string v2, "UID"

    move-object/from16 v52, v1

    const/16 v1, 0x1c

    invoke-direct {v0, v2, v1}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->UID:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 578
    new-instance v1, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const-string v2, "UNANSWERED"

    move-object/from16 v53, v0

    const/16 v0, 0x1d

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->UNANSWERED:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 580
    new-instance v0, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const-string v2, "UNDELETED"

    move-object/from16 v54, v1

    const/16 v1, 0x1e

    invoke-direct {v0, v2, v1}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->UNDELETED:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 582
    new-instance v1, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const-string v2, "UNDRAFT"

    move-object/from16 v55, v0

    const/16 v0, 0x1f

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->UNDRAFT:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 584
    new-instance v0, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const-string v2, "UNFLAGGED"

    move-object/from16 v56, v1

    const/16 v1, 0x20

    invoke-direct {v0, v2, v1}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->UNFLAGGED:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 586
    new-instance v1, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const-string v2, "UNKEYWORD"

    move-object/from16 v57, v0

    const/16 v0, 0x21

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->UNKEYWORD:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    .line 588
    new-instance v0, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const-string v2, "UNSEEN"

    move-object/from16 v58, v1

    const/16 v1, 0x22

    invoke-direct {v0, v2, v1}, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->UNSEEN:Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    const/16 v1, 0x23

    .line 455
    new-array v1, v1, [Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    aput-object v30, v1, v16

    aput-object v32, v1, v18

    aput-object v3, v1, v20

    aput-object v5, v1, v22

    aput-object v7, v1, v24

    aput-object v9, v1, v26

    aput-object v11, v1, v28

    aput-object v13, v1, v17

    aput-object v15, v1, v19

    aput-object v34, v1, v21

    aput-object v4, v1, v23

    aput-object v6, v1, v25

    aput-object v8, v1, v27

    aput-object v10, v1, v29

    aput-object v12, v1, v31

    aput-object v14, v1, v33

    aput-object v36, v1, v35

    aput-object v38, v1, v37

    aput-object v40, v1, v39

    aput-object v42, v1, v41

    aput-object v44, v1, v43

    aput-object v46, v1, v45

    const/16 v2, 0x16

    aput-object v47, v1, v2

    const/16 v2, 0x17

    aput-object v48, v1, v2

    const/16 v2, 0x18

    aput-object v49, v1, v2

    const/16 v2, 0x19

    aput-object v50, v1, v2

    const/16 v2, 0x1a

    aput-object v51, v1, v2

    const/16 v2, 0x1b

    aput-object v52, v1, v2

    const/16 v2, 0x1c

    aput-object v53, v1, v2

    const/16 v2, 0x1d

    aput-object v54, v1, v2

    const/16 v2, 0x1e

    aput-object v55, v1, v2

    const/16 v2, 0x1f

    aput-object v56, v1, v2

    const/16 v2, 0x20

    aput-object v57, v1, v2

    const/16 v2, 0x21

    aput-object v58, v1, v2

    const/16 v2, 0x22

    aput-object v0, v1, v2

    sput-object v1, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->$VALUES:[Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 455
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;
    .locals 1

    .line 455
    const-class v0, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    return-object p0
.end method

.method public static values()[Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;
    .locals 1

    .line 455
    sget-object v0, Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->$VALUES:[Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    invoke-virtual {v0}, [Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA;

    return-object v0
.end method
